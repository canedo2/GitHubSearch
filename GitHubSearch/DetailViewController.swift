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
    
    var repository:Repository?
    
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlButton.setTitle(repository!.url.absoluteString, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRepositorySafariView(_ sender: Any) {
        
        let sfViewController = SFSafariViewController(url: repository!.url)
        present(sfViewController, animated: true, completion: nil)
    }
}
