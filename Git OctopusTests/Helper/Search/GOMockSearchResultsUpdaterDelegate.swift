//
//  GOMockSearchResultsUpdaterDelegate.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

@testable import Git_Octopus

class GOMockSearchResultsUpdaterDelegate: GOSearchResultsUpdaterDelegate {
    
    var loadCalled = false
    func load(query: String?) {
        self.loadCalled = true
    }

}
