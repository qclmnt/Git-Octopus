//
//  GOParser.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

struct GOParser {
    
    static func parse<T: Codable>(array: [[String: Any]], type: T.Type) -> [T] {
        
        var repositories = [T]()
        let decoder = JSONDecoder()
        
        for dict in array {
            do {
                let dataToParse = try JSONSerialization.data(withJSONObject: dict, options: [])
                let repo = try decoder.decode(T.self, from: dataToParse)
                repositories.append(repo)
            } catch {
                
            }
        }
        
        return repositories
        
    }
}
