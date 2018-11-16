//
//  GOEnvironment.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation
import QCNetwork

protocol GOEnvironment {
    var routing: QCNavigator? { get set }
    var api: QCAPI? { get set }
    var session: GOSession? { get set }
}
