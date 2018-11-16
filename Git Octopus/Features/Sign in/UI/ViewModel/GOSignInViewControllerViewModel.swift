//
//  GOSignInViewControllerViewModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 05/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

import AuthenticationServices

private let callbackURLScheme = "gitoctopus://"

class GOSignInViewControllerViewModel: QCViewControllerViewModel {
    
    // MARK: - Properties
    
    lazy var signInTitle: String = NSLocalizedString("signIn.title", comment: "")
    lazy var signInSubtitle: String = NSLocalizedString("signIn.subtitle", comment: "")
    lazy var signInButtonTitle: String = NSLocalizedString("signIn.button.title", comment: "")
    
    var webAuthSession: ASWebAuthenticationSession?
    lazy var loginUrl = URL(string: GOGitHubConstant.loginUrlString)
    
    // MARK: - Sign in
    
    func signInWithGithub() {
        
        guard let loginURL = self.loginUrl else {return}
        
        // 1. Ask for authorization
        
        self.webAuthSession = ASWebAuthenticationSession.init(url: loginURL,
                                                              callbackURLScheme: callbackURLScheme,
                                                              completionHandler: { [weak self] (callBack:URL?, error:Error?) in
            
            guard error == nil,
                let successURL = callBack,
                let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == GOAPIConstant.code}).first,
                let code = oauthToken.value else {
                    
                return
            }
            
            // 2. Get git hub access token
            self?.getGithubAccessToken(code: code)
        })
        
        self.webAuthSession?.start()
    }
    
    func getGithubAccessToken(code: String) {
        let getAccessTokenApiEntry = GOPostGitHubAccessTokenApiEntry(code: code, clientId: GOGitHubConstant.clientId, clientSecret: GOGitHubConstant.clientSecret)
        GOAppEnvironment.shared().api?.request(with: getAccessTokenApiEntry, success: { (response) in
            guard let accessToken = response as? String else {return}
            
            GOAppEnvironment.shared().session?.accessToken = accessToken
            
            let viewController = GORepositoriesViewController()
            let navController = GONavigationController(rootViewController: viewController)
            UIApplication.shared.keyWindow?.rootViewController = navController
        }, failure: { (task, error, statusCode) in
            
        })
    }
    
}
