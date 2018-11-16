//
//  GOGetSearchRepositoryAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Example: https://api.github.com/search/repositories?q=message&page=1&per_page=2

struct GOGetSearchRepositoryAPIEntry: QCAPIEntry {
    
    // MARK: - Properties
    
    let query: String
    let page: Int
    let resultPerPage: Int
    
    // MARK: - QCAPIEntry
    
    var path: String {
        return "search/repositories"
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return [GOAPIConstant.query: self.query.lowercased(),
                GOAPIConstant.page: self.page,
                GOAPIConstant.perPage: self.resultPerPage]
    }
    
    func parsing(responseObject: Any?) -> Any? {
        guard let responseDict = responseObject as? [String: Any],
            let responseArray = responseDict[GOAPIConstant.items] as? [[String: Any]] else {return nil}
        return GOParser.parse(array: responseArray, type: GORepository.self)
    }
}
