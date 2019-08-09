//
//  JobsTableViewController.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-28.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit
import Apollo

class JobsTableViewController: UITableViewController {

    public var country: CountriesQuery.Data.Country? {
        didSet {
            loadJobsByCountry()
        }
    }
    
    public var city: CountryQuery.Data.Country.City? {
        didSet {
            loadJobsByCity()
        }
    }
    
    var jobs: [JobSummary]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedJob: JobSummary?
    
    var cityJobsWatcher: GraphQLQueryWatcher<JobsCityQuery>?
    
    func loadJobsByCity() {
        cityJobsWatcher = apollo.watch(query: JobsCityQuery(location: LocationInput(slug: city?.slug ?? ""))) { result in
            switch result {
            case .failure(let error):
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            case .success(let response):
                self.jobs = response.data?.city.jobs?.compactMap({ $0.fragments.jobSummary })
                return
            }
        }
    }
    
    var countryJobsWatcher: GraphQLQueryWatcher<JobsCountryQuery>?
    
    func loadJobsByCountry() {
        countryJobsWatcher = apollo.watch(query: JobsCountryQuery(location: LocationInput(slug: country?.slug ?? ""))) { result in
            switch result {
            case .failure(let error):
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            case .success(let response):
                self.jobs = response.data?.country.cities?.flatMap({ $0.jobs ?? [] }).map({ $0.fragments.jobSummary })
                return
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobDetails" {
            guard let jobDetailsVC = segue.destination as? JobDetailsTableTableViewController else {
                return
            }
            
            jobDetailsVC.jobSummary = self.selectedJob
            self.selectedJob = nil
        }
    }
}

extension JobsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let jobs = self.jobs else {
            return 0;
        }

        return jobs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? JobTableViewCell else {
            fatalError("Could not dequeue JobTableViewCell")
        }

        if let jobs = self.jobs {
            let job = jobs[indexPath.row]
            cell.configure(with: job)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let jobs = self.jobs {
            selectedJob = jobs[indexPath.row]
        }

        self.performSegue(withIdentifier: "JobDetails", sender: self)
    }
}
