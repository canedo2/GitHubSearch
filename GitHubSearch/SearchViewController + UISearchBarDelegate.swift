//
//  File.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UISearchBarDelegate{
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchString = searchBar.text else{
            print("Empty searchbar")
            return
        }
        model.fillWithSearch(searchString: searchString)
        dismissKeyboard()
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
}
