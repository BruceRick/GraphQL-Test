//
//  JobDetailsTableTableViewController.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-08-08.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit
import Apollo

class JobDetailsTableTableViewController: UITableViewController {

    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var commitmentLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var applyURLLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var jobSummary: JobSummary? {
        didSet {
            loadJobDetails()
        }
    }
    
    var jobDetails: JobDetails? {
        didSet {
            updateLabels()
        }
    }
    
    private lazy var loadingView: UIView = {
        guard let navigationController = navigationController else {
            fatalError("This view controller has no navigation controller")
        }
        
        let loadingView = UIView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.backgroundColor = UIColor.white
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.black
        activityIndicator.startAnimating()
        loadingView.addSubview(activityIndicator)
        
        navigationController.view.addSubview(loadingView)
        navigationController.view.bringSubviewToFront(navigationController.navigationBar)
        NSLayoutConstraint.activate([
            loadingView.leadingAnchor.constraint(equalTo: navigationController.view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: navigationController.view.trailingAnchor),
            loadingView.topAnchor.constraint(equalTo: navigationController.view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: navigationController.view.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
        return loadingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.isHidden = false
    }
    
    var watcher: GraphQLQueryWatcher<JobDetailsQuery>?
    
    func loadJobDetails() {
        watcher = apollo.watch(query: JobDetailsQuery(jobInput: JobInput(companySlug: jobSummary?.company?.slug ?? "", jobSlug: jobSummary?.slug ?? ""))) { result in
            switch result {
            case .failure(let error):
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            case .success(let response):
                self.jobDetails = response.data?.job.fragments.jobDetails
                return
            }
        }
    }
        
    func updateLabels() {
        loadingView.isHidden = true
        
        if let jobSummary = jobSummary {
            locationLabel.text = jobSummary.cities?.compactMap({ $0.name }).joined(separator: ", ")
            jobTitleLabel.text = jobSummary.title
            companyNameLabel.text = jobSummary.company?.name
            try? updateCompanyLogo(urlString: jobSummary.company?.logoUrl)
        }
        
        if let jobDetails = jobDetails {
            commitmentLabel.text = jobDetails.commitment.title
            applyURLLabel.text = jobDetails.applyUrl
            descriptionTextView.text = jobDetails.description
        }
    }
    
    func updateCompanyLogo(urlString: String?) throws {
        if let urlString = urlString,
            let url = URL(string: urlString),
            let image = UIImage(data: try Data(contentsOf: url))
        {
            companyImageView.image = image
            companyImageView.isHidden = false
        }
        else {
            companyImageView.isHidden = true
        }
        
        tableView.reloadData()
    }
}

extension JobDetailsTableTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 && companyImageView.isHidden == true {
            return 0.1
        }
        
        return UITableView.automaticDimension
    }
}
