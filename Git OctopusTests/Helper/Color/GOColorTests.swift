//
//  GOColorTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOColorTests: XCTestCase {

    // MARK: - appBlue
    func test_appBlue_shouldReturnBlueColor() {
        
        // Given
        let testBlueColor = UIColor(named: "appBlue")
        
        // When
        let blueColor = UIColor.appBlue
        
        // Then
        XCTAssertNotNil(testBlueColor)
        XCTAssertEqual(blueColor, testBlueColor)
    }
    
    // MARK: - appLightBlue
    func test_appLightBlue_shouldReturnBlueLightColor() {
        
        // Given
        let testBlueColor = UIColor(named: "appLightBlue")
        
        // When
        let blueColor = UIColor.appLightBlue
        
        // Then
        XCTAssertNotNil(testBlueColor)
        XCTAssertEqual(blueColor, testBlueColor)
    }
    
    // MARK: - appLightGray
    func test_appLightGray_shouldReturnGrayLightColor() {
        
        // Given
        let testColor = UIColor(named: "appLightGray")
        
        // When
        let color = UIColor.appLightGray
        
        // Then
        XCTAssertNotNil(testColor)
        XCTAssertEqual(color, testColor)
    }

}
