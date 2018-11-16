//
//  GOSession.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

protocol GOSession {
    var accessToken: String? {get set}
    
    func signOut()
}
