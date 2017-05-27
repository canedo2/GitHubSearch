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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewController.reuseCellId, for: indexPath);
        cell.textLabel?.text = ("Number \(arc4random_uniform(150))")
        return cell;
    
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SearchViewController.segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! DetailViewController
        destinationController.repositoryURL = "https://www.github.com/canedo2"
    }

}
