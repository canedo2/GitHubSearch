//
//  JsonParseService.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
class JsonParseService:JsonParseProtocol{
    
    func asyncParseToCocoaDictionary(jsonData: Data, storage: JsonParseStorageProtocol) {
        DispatchQueue.global().async {
            guard let results = self.convertJsonResultsToDictionary(data: jsonData) else{
                print("Error in dataTask: convertResultsToJSON")
                return
            }
            DispatchQueue.main.sync {
                storage.processJsonParseDictionary(result:results)
            }
        }
    }
    
    func  convertJsonResultsToDictionary(data: Data) -> [String:AnyObject]?{
        let results: [String:AnyObject]?
        do {
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                print("Error in JsonParseService: Couldn't to convert data to JSON")
                return nil
            }
            results = dictionary
        } catch  {
            print("Error in JsonParseService: Exception (Data to JSON)")
            return nil
        }
        return results
    }
    
}
