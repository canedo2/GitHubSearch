//
//  ApiService.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
class ApiService: ApiServiceProtocol {
    let baseUrlString = "https://api.github.com/search/repositories?q="
    let optionsString = "&sort=stars&order=desc"
    
    
    func performRequest(searchString:String, dataProcessor:DataProcessProtocol){
        
        let url = URL(string: "\(baseUrlString)\(searchString)\(optionsString)")
        
        guard let dataTaskUrl = url else {
            return
        }

        let dataTask = createSearchForRepositoriesDataTask(url: dataTaskUrl,dataProcessor: dataProcessor)
        
        dataTask.resume()
        
    }
    
    func createSearchForRepositoriesDataTask(url: URL, dataProcessor:DataProcessProtocol) -> URLSessionDataTask{
        
        let session = URLSession(configuration: .default)
        let urlRequest = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else{
                print ("Error in dataTask: search: \(error!)")
                return
            }
            guard let responseData = data else{
                print("Error in dataTask: Did not recieve data")
                return
            }
            
            DispatchQueue.main.async {
                dataProcessor.process(data:responseData)
            }
        }
        
        return dataTask;
    }
    
    
}
