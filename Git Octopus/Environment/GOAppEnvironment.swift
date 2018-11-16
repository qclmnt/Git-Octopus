//
//  GOAppEnvironment.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//


/*
 * /!\ 🚨 /!\ WARNING /!\ 🚨 /!\
 * Every target of the app should
 * implement a GOAppEnvironment extension
 * in order to mock the AppEnvironment
 * for the unit tests.
 */

import QCNavigation
import QCNetwork

class GOAppEnvironment: GOEnvironment {
    
    static let instance = GOAppEnvironment()
    
    class func shared() -> GOAppEnvironment {
        return instance
    }

    // MARK: - GOEnvironment
    
    var routing: QCNavigator?
    var api: QCAPI?
    var session: GOSession?
}
