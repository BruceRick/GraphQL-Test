//
//  AllPokemonViewController.swift
//  GraphQL-Test
//
//  Created by Bruce Rick on 2019-07-23.
//  Copyright © 2019 Bruce Rick. All rights reserved.
//

import UIKit

class AllPokemonViewController: UITableViewController {

    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAllPokemon()
    }
    
    func loadAllPokemon() {
        
    }
}

extension AllPokemonViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell else {
            fatalError("Could not dequeue PostTableViewCell")
        }
        
        return cell
    }
}
