//
//  GOAppSession.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import KeychainAccess
import Foundation

class GOAppSession: GOSession {
    
    static let bundleIdentifier = "com.QC.Git-Octopus"
    lazy var keychain = Keychain(service: GOAppSession.bundleIdentifier)
    
    // local property to avoid access keychain everytime (more efficient)
    var accessTokenWithoutAccessingKeychain: String?
    
    var accessToken: String? {
        get {
            if let accessToken = self.accessTokenWithoutAccessingKeychain,
                accessToken.count > 0 {
                return accessToken
            } else {
                let tempAccessToken = self.keychain[GOAPIConstant.accessToken]
                self.accessTokenWithoutAccessingKeychain = tempAccessToken
                return tempAccessToken
            }
            
        }
        set (newToken) {
            if let newTokenToSave = newToken,
                newTokenToSave.count > 0 {
                self.keychain[string: GOAPIConstant.accessToken] = newTokenToSave
                self.accessTokenWithoutAccessingKeychain = newTokenToSave
            } else {
                self.keychain[string: GOAPIConstant.accessToken] = nil
                self.accessTokenWithoutAccessingKeychain = nil
            }
        }
    }
    
    func signOut() {
        self.accessToken = nil
        UIApplication.shared.keyWindow?.rootViewController = GOSignInViewController()
    }
    
}
