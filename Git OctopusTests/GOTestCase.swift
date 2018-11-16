//
//  GOTestCase.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOTestCase: XCTestCase {

    override func setUp() {
        GOAppEnvironment.shared().configureAppEnvironment()
    }

}
