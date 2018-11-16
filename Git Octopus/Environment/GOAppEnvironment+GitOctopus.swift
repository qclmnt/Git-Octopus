//
//  GOAppEnvironment+GitOctopus.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

extension GOAppEnvironment {
    
    func configureAppEnvironment() {
        self.routing = QCRouting()
        self.api = GOAPI()
        self.session = GOAppSession()
    }
    
}
