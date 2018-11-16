//
//  GOGitHubConstantTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOGitHubConstantTests: XCTestCase {

    // MARK: - clientId
    func test_clientId_shouldReturnGoodClientId() {
        
        // Given & When & Then
        XCTAssertEqual(GOGitHubConstant.clientId, "f6d849744c517c159f82")
    }
    
    // MARK: - clientSecret
    func test_clientSecret_shouldReturnGoodClientSecret() {
        
        // Given & When & Then
        XCTAssertEqual(GOGitHubConstant.clientSecret, "ad9db08e70883972e37334a60a5e431540cb9d4f")
    }
    
    // MARK: - loginUrlString
    func test_loginUrlString_shouldReturnGoodLoginUrlString() {
        
        // Given & When & Then
        XCTAssertEqual(GOGitHubConstant.loginUrlString, "https://github.com/login/oauth/authorize?client_id=\(GOGitHubConstant.clientId)&scope=user+repo")
    }

}
