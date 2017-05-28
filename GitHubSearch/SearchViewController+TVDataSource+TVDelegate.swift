//
//  SearchViewController+TVDataSource+TVDelegate.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 27/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    static let reuseCellId = "RepositoryCell"
    static let segueIdentifier = "DetailSegue"
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewController.reuseCellId, for: indexPath)
        let item = self.model.items[indexPath.row]
        cell.textLabel?.text = ("\(item.user)/\(item.name)")
        return cell;
    
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.items.count;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRepository = indexPath.row
        performSegue(withIdentifier: SearchViewController.segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! DetailViewController
        destinationController.repository = model.items[selectedRepository]
    }

}
