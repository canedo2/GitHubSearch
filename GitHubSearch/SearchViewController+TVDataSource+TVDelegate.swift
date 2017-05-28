//
//  SearchViewController+TVDataSource+TVDelegate.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 27/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    static let reuseCellId = "RepositoryCell"
    static let segueIdentifier = "DetailSegue"
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewController.reuseCellId, for: indexPath) as! RepositoryCell
        let item = self.model.items[indexPath.row]
        cell.titleLabel.text = "\(item.user)/\(item.name)"
        cell.overviewLabel.text = "\(item.description)"
        cell.userImageView.sd_setImage(with: URL(string:item.userImageUrl)!, placeholderImage: UIImage(named: "github-image"))
        print(item.userImageUrl)
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


