//
//  GOSearchIssueInRepositoryAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Example: https://api.github.com/search/issues?q=work+repo:timgrossmann/InstaPy+in=title

struct GOSearchIssueInRepositoryAPIEntry: QCAPIEntry {
    
    // MARK: - Properties
    
    let query: String
    let repoFullName: String
    
    // MARK: - QCAPIEntry
    
    var path: String {
        return "search/issues"
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return [GOAPIConstant.query: "\(self.query.lowercased())+repo:\(self.repoFullName)+in:title"]
    }
    
    func parsing(responseObject: Any?) -> Any? {
        guard let responseDict = responseObject as? [String: Any],
            let responseArray = responseDict[GOAPIConstant.items] as? [[String: Any]] else {return nil}
        return GOParser.parse(array: responseArray, type: GOIssue.self)
    }

}
