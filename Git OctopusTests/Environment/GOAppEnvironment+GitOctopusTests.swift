//
//  GOAppEnvironment+GitOctopusTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

@testable import Git_Octopus

import QCNetwork

extension GOAppEnvironment {
    
    func configureAppEnvironment() {
        self.api = GOMockAPI()
        self.routing = GOMockRouting()
    }
    
}
