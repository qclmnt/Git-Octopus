//
//  GOGetRepositoryIssuesAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Example: https://api.github.com/repos/timgrossmann/InstaPy/issues

struct GOGetRepositoryIssuesAPIEntry: QCAPIEntry {
    
    // MARK: - Properties
    
    let repoFullName: String
    
    // MARK: - QCAPIEntry
    
    var path: String {
        return "repos/\(self.repoFullName)/issues"
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return nil
    }
    
    func parsing(responseObject: Any?) -> Any? {
        guard let responseArray = responseObject as? [[String: Any]] else {return nil}
        return GOParser.parse(array: responseArray, type: GOIssue.self)
    }

}
