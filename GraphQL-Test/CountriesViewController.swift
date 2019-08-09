//
//  CountriesViewController.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-23.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit
import Apollo

class CountriesViewController: UITableViewController {

    var countries: [CountriesQuery.Data.Country]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedCountry: CountriesQuery.Data.Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Cities" {
            guard let citiesVC = segue.destination as? CitiesViewControllerTableViewController else {
                return
            }
            
            citiesVC.selectedCountry = selectedCountry
        }
    }
    
    var watcher: GraphQLQueryWatcher<CountriesQuery>?
    
    func loadCountries() {
        watcher = apollo.watch(query: CountriesQuery()) { result in
            switch result {
            case .failure(let error):
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            case .success(let response):
                self.countries = response.data?.countries
                return
            }
        }
    }
}

extension CountriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries?[indexPath.row].name ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = self.countries?[indexPath.row]
        self.performSegue(withIdentifier: "Cities", sender: self)
    }
}
