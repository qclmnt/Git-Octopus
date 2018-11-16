//
//  GOIssue.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GOIssue: Codable {
    
    let title: String?
    let state: String?
    let commentsCount: Int?
    let updateAt: String?

    // MARK: - Codable
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case state = "state"
        case commentsCount = "comments"
        case updateAt = "updated_at"
    }
}
