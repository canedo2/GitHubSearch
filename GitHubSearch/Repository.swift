//
//  Repository.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
class Repository{
    
    let name:String
    let user:String
    let url:URL
    let date:Date
    let stars:Int
    let watchers:Int
    let forks:Int
    let description:String
    let userImageUrl:String
    
    init(name: String ,user: String, url: URL, date:Date, stars:Int, watchers:Int, forks:Int, description:String, userImageUrl: String){
        self.name = name
        self.user = user
        self.url = url
        self.date = date
        self.stars = stars
        self.watchers = watchers
        self.forks = forks
        self.description = description
        self.userImageUrl = userImageUrl
    }
}
