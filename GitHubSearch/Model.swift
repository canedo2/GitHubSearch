//
//  Model.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
class Model:DataProcessProtocol,JsonParseStorageProtocol{
    
    let apiService:ApiServiceProtocol
    let jsonParseService:JsonParseProtocol
    
    var items = [Repository]()
    
    init(apiService: ApiServiceProtocol, jsonParseService: JsonParseProtocol){
        self.apiService = apiService
        self.jsonParseService = jsonParseService
    }
    
    func fillWithSearch(searchString:String){
        apiService.performRequest(searchString: searchString, dataProcessor: self)
    }
    
    //DataProcessProtocol - ApiService
    func process(data: Data) {
        jsonParseService.asyncParseToCocoaDictionary(jsonData: data, storage: self)
    }
    
    //JsonParseStorageProtocol - JsonParseService
    func processJsonParseDictionary(result:[String:AnyObject]) {
            items.removeAll()
        for item in result["items"] as! [[String:AnyObject]]{
            let repository = createRepository(dictionary: item)
            items.append(repository)
        }
        
        NotificationCenter.default.post(Notification.init(name: .init("ModelHasChanged")))
    }
    
    func createRepository(dictionary:[String:AnyObject]) -> Repository{
        
        let name = dictionary["name"] as! String
        
        let user = dictionary["owner"]?["login"] as! String
        
        let urlString = dictionary["html_url"] as! String
        let url = URL(string: urlString)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let shortDate = (dictionary["created_at"] as? String ?? "2000-01-01T").components(separatedBy: "T")[0]
        let date = dateFormatter.date(from: shortDate)
        
        let stars = dictionary["watchers_count"] as? Int ?? 0
        
        let watchers = dictionary["watchers_count"] as? Int ?? 0
        
        let forks = dictionary["forks"] as? Int ?? 0
        
        let description = dictionary["description"] as? String ?? "No description available"
        
        let repository = Repository(name: name, user: user, url: url, date: date!, stars: stars, watchers: watchers, forks: forks, description: description)
        
        return repository
    }
    
}
