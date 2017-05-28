//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 27/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import UIKit

class SearchViewController: GeneralViewController 
{
    let model:Model=Model(apiService: ApiService(),jsonParseService:JsonParseService())
    var selectedRepository:Int = -1
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.modelHasChangedNotificationMethod), name: NSNotification.Name.init(rawValue: "ModelHasChanged"), object: nil)
    }
    
    func modelHasChangedNotificationMethod(){
        tableView.reloadData()
    }
}
