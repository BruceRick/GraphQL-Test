//
//  CitiesViewControllerTableViewController.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-26.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit

import UIKit
import Apollo

class CitiesViewControllerTableViewController: UITableViewController {
    
    public var selectedCountry: CountriesQuery.Data.Country? {
        didSet {
            loadCities()
        }
    }
    
    var cities: [CountryQuery.Data.Country.City]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedCity: CountryQuery.Data.Country.City?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Jobs" {
            guard let jobsVC = segue.destination as? JobsTableViewController else {
                return
            }
            
            if let selectedCity = self.selectedCity {
                jobsVC.city = selectedCity
            } else {
                jobsVC.country = selectedCountry
            }
            
            selectedCity = nil
        }
    }
    
    var watcher: GraphQLQueryWatcher<CountryQuery>?
    
    func loadCities() {
        watcher = apollo.watch(query: CountryQuery(location: LocationInput(slug: selectedCountry?.slug ?? ""))) { result in
            switch result {
            case .failure(let error):
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            case .success(let response):
                self.cities = response.data?.country.cities
                return
            }
        }
    }
}

extension CitiesViewControllerTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cities = self.cities else {
            return 0;
        }
        
        return cities.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "All jobs"
        }
        else {
            cell.textLabel?.text = cities?[indexPath.row - 1].name ?? ""
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let citiesCount = cities?.count, indexPath.row != 0 && indexPath.row - 1 < citiesCount {
            selectedCity = cities?[indexPath.row - 1]
        }
        
        self.performSegue(withIdentifier: "Jobs", sender: self)
    }
}
