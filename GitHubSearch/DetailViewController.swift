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
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = repository?.name
        urlButton.setTitle(repository!.url.absoluteString, for: UIControlState.normal)
        
        userLabel.text = "Created by: \(repository!.user)"
        dateLabel.text = "Created at: \(repository!.date)"
        starLabel.text = "Stars: \(repository!.stars)"
        watchersLabel.text = "Watchers: \(repository!.watchers)"
        forksLabel.text = "Forks: \(repository!.forks)"
        descriptionTextView.text = "Description: \(repository!.description)"
        
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
