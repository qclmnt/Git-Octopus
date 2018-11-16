//
//  GOLanguageColorTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOLanguageColorTests: XCTestCase {

    // MARK: - colors
    func test_colors_shouldReturn6Colors() {
        
        // Given & When
        let colors = GOLanguageColor.colors
        
        // Then
        XCTAssertEqual(colors.count, 6)
        XCTAssertEqual(colors["Objective-C"], UIColor.appBlue)
        XCTAssertEqual(colors["Swift"], UIColor.appLightBlue)
        XCTAssertEqual(colors["Java"], UIColor.orange)
        XCTAssertEqual(colors["JavaScript"], UIColor.orange)
        XCTAssertEqual(colors["HTML"], UIColor.green)
        XCTAssertEqual(colors["Ruby"], UIColor.purple)
    }
    
    // MARK: - getColor
    
    func test_getColor_shouldReturnGoodColor_forExistingLanguage() {
        
        // Given
        let language = "Swift"
        
        // When
        let color = GOLanguageColor.getColor(for: language)
        
        // Then
        XCTAssertEqual(color, .appLightBlue)
    }
    
    func test_getColor_shouldReturnGrayColor_forNonExistingLanguage() {
        
        // Given
        let language = "Language"
        
        // When
        let color = GOLanguageColor.getColor(for: language)
        
        // Then
        XCTAssertEqual(color, .gray)
    }
    
    func test_getColor_shouldReturnGrayColor_forNilLanguage() {
        
        // Given
        let language: String? = nil
        
        // When
        let color = GOLanguageColor.getColor(for: language)
        
        // Then
        XCTAssertEqual(color, .gray)
    }

}
