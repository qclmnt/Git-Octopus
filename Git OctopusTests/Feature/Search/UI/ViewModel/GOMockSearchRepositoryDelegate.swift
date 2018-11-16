//
//  GOMockSearchRepositoryDelegate.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

@testable import Git_Octopus

class GOMockSearchRepositoryDelegate: GOSearchRepositoryDelegate {

    var userWatchedARepositoryCalled = false
    func userWatchedARepository() {
        self.userWatchedARepositoryCalled = true
    }
}
