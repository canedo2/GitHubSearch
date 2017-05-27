//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 27/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: GeneralViewController {
    
    var repositoryURL:String?
    
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlButton.setTitle(repositoryURL, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRepositorySafariView(_ sender: Any) {
        
        guard let repoUrlString = repositoryURL else{
            print("Critical error: DetailViewController has no url")
            return;
        }
        
        guard let url = URL(string:repoUrlString) else{
            print("Critical error: DetailViewController was unable to create an url")
            return;
        }
        
        let sfViewController = SFSafariViewController(url: url)
        present(sfViewController, animated: true, completion: nil)
    }
}
