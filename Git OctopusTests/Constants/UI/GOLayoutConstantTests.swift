//
//  GOLayoutConstantTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOLayoutConstantTests: XCTestCase {

    // MARK: - cornerRadius
    func test_cornerRadius_shouldReturn5() {
        
        // Given & When & Then
        XCTAssertEqual(GOLayoutConstant.cornerRadius, CGFloat(5.0))
    }

}
