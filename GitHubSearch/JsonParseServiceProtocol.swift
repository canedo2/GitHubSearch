//
//  JsonParseProtocol.swift
//  GitHubSearch
//
//  Created by Diego Manuel Molina Canedo on 28/5/17.
//  Copyright © 2017 Universidad Pontificia de Salamanca. All rights reserved.
//

import Foundation
protocol JsonParseProtocol{
    func asyncParseToCocoaDictionary(jsonData:Data, storage: JsonParseStorageProtocol)
}
