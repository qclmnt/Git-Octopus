//
//  GORepository.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GORepository: Codable {
    
    let fullName: String?
    let desc: String?
    let starsCount: Int?
    let language: String?
    var watched: Bool = false
    
    // MARK: - Codable
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case desc = "description"
        case starsCount = "stargazers_count"
        case language = "language"
    }

}
