//
//  GOPostGitHubAccessTokenApiEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOPostGitHubAccessTokenApiEntryTests: XCTestCase {

    // MARK: - init
    func test_init_shouldSetProperties() {
        
        // Given
        let code = "code"
        let clientId = "clientID"
        let clientSecret = "clientSecret"
        
        // When
        let apiEntry = GOPostGitHubAccessTokenApiEntry(code: code,
                                                       clientId: clientId,
                                                       clientSecret: clientSecret)
        
        // Then
        XCTAssertEqual(apiEntry.code, code)
        XCTAssertEqual(apiEntry.clientId, clientId)
        XCTAssertEqual(apiEntry.clientSecret, clientSecret)
    }
    
    // MARK: - path
    func test_path_shouldReturnGoodPath() {
        
        // Given
        let apiEntry = self.getApiEntryForTests()
        
        // When & Then
        XCTAssertEqual(apiEntry.path, "login/oauth/access_token")
    }
    
    // MARK: - method
    func test_method_shouldReturnPOST() {
        
        // Given
        let apiEntry = self.getApiEntryForTests()
        
        // When & Then
        XCTAssertEqual(apiEntry.method, .post)
    }
    
    // MARK: - entryParameters
    func test_entryParameters_shouldReturnParams_with3Values() {
        
        // Given
        let code = "code"
        let clientId = "clientID"
        let clientSecret = "clientSecret"
        let apiEntry = GOPostGitHubAccessTokenApiEntry(code: code,
                                                       clientId: clientId,
                                                       clientSecret: clientSecret)
        
        // When
        let entryParams = apiEntry.entryParameters
        
        // Then
        XCTAssertNotNil(entryParams)
        XCTAssertEqual(entryParams?.count, 3)
        XCTAssertEqual(entryParams?[GOAPIConstant.code] as? String, code)
        XCTAssertEqual(entryParams?[GOAPIConstant.clientId] as? String, clientId)
        XCTAssertEqual(entryParams?[GOAPIConstant.clientSecret] as? String, clientSecret)
    }
    
    // MARK: - Parsing
    func test_parsing_shouldReturnAccessToken() {
        
        // Given
        let apiEntry = self.getApiEntryForTests()
        let accessToken = "accessToken"
        
        // When
        let response = apiEntry.parsing(responseObject: [GOAPIConstant.accessToken: accessToken])
        
        // Then
        XCTAssertEqual(response as? String, accessToken)
    }
    
    // MARK: - Helper
    func getApiEntryForTests() -> GOPostGitHubAccessTokenApiEntry {
        return GOPostGitHubAccessTokenApiEntry(code: "code",
                                               clientId: "clientId",
                                               clientSecret: "clientSecret")
    }

}
