//
//  GOPostGitHubAccessTokenApiEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

struct GOPostGitHubAccessTokenApiEntry: QCAPIEntry {
    
    // MARK: - Properties
    
    let code: String
    let clientId: String
    let clientSecret: String
    
    // MARK: - Initialization
    
    init(code: String,
         clientId: String,
         clientSecret: String) {
        
        self.code = code
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
    
    // MARK: - QCAPIEntry
    
    var basePath: String {
        return "https://github.com/"
    }
    
    var path: String {
        return "login/oauth/access_token"
    }
    
    var method: QCAPIMethod {
        return .post
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return [
            GOAPIConstant.code: self.code,
            GOAPIConstant.clientId: self.clientId,
            GOAPIConstant.clientSecret: self.clientSecret
        ]
    }
    
    func parsing(responseObject: Any?) -> Any? {
        
        guard let reponseDict = responseObject as? [String: Any],
            let accessToken = reponseDict[GOAPIConstant.accessToken] as? String else {return nil}
        
        return accessToken
    }
    
}
