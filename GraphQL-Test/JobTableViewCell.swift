//
//  JobTableViewCell.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-26.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit
import AVKit

class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    func configure(with jobDetails: JobSummary) {
        try? updateCompanyLogo(urlString: jobDetails.company?.logoUrl)
        titleLabel.text = jobDetails.title
        companyLabel.text = jobDetails.company?.name
        cityLabel.text = jobDetails.cities?.compactMap({ $0.name }).joined(separator: ", ")
    }
    
    func updateCompanyLogo(urlString: String?) throws {
        if let urlString = urlString,
           let url = URL(string: urlString),
           let image = UIImage(data: try Data(contentsOf: url))
        {
            companyLogoImageView.image = image
            companyLogoImageView.isHidden = false
        }
        else {
            companyLogoImageView.isHidden = true
        }
    }
}
