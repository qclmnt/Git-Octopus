//
//  AppDelegate.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 05/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Build window
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.frame = UIScreen.main.bounds
        
        // Configure app environment
        GOAppEnvironment.shared().configureAppEnvironment()
        
        // Build Root
        self.buildRoot()
        
        // Configure global layout
        UINavigationBar.appearance().isTranslucent = false
        
        return true
    }
    
    // MARK: - Build root
    
    func buildRoot() {
        
        if let _ = GOAppEnvironment.shared().session?.accessToken { // User connected
            
            let viewController = GORepositoriesViewController()
            let navController = GONavigationController(rootViewController: viewController)
            self.window?.rootViewController = navController
            
        } else {                                                    // User not connected
            
            self.window?.rootViewController = GOSignInViewController()
            
        }
        
    }


}

