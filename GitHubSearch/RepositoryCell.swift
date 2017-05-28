//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    weak var item: Repository?
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        //TODO: Use CoreData
        if( UserDefaults.standard.bool(forKey: "\(item!.name)+\(item!.user)") ){
            self.contentView.backgroundColor = UIColor.white
            UserDefaults.standard.set(false, forKey: "\(item!.name)+\(item!.user)")
        }
            
        else{
            self.contentView.backgroundColor = UIColor.blue
            UserDefaults.standard.set(true, forKey: "\(item!.name)+\(item!.user)")
        }
    }
    
}
