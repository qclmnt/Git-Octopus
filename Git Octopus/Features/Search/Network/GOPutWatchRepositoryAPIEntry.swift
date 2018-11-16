//
//  GOPutWatchRepositoryAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Example: https://api.github.com/repos/timgrossmann/InstaPy/subscription?access_token={accesstoken}

class GOPutWatchRepositoryAPIEntry: QCAPIEntry {
    
    // MARK: - Properties
    
    let repoFullName: String
    
    // MARK: - Initialization
    
    init(repoFullName: String) {
        self.repoFullName = repoFullName
    }
    
    // MARK: - QCAPIEntry
    
    var method: QCAPIMethod {
        return .put
    }
    
    var path: String {
        return "repos/\(self.repoFullName)/subscription?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")"
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return nil
    }

}
