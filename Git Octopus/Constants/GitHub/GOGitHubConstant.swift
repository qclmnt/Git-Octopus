//
//  GOGitHubConstant.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

struct GOGitHubConstant {
    
    // MARK: - OAuth App Settings
    
    // In production we should obfuscate keys to protect the key in code, and use HTTPS to send it to the API
    static let clientId = "f6d849744c517c159f82"
    static let clientSecret = "ad9db08e70883972e37334a60a5e431540cb9d4f"
    static let loginUrlString = "https://github.com/login/oauth/authorize?client_id=\(GOGitHubConstant.clientId)&scope=user+repo"
    
}
