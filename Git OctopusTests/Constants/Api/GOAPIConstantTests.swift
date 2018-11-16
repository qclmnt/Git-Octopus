//
//  GOAPIConstantTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOAPIConstantTests: XCTestCase {

    // MARK: - code
    func test_code_shouldReturnCode() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.code, "code")
    }
    
    // MARK: - clientId
    func test_clientId_shouldReturnClientId() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.clientId, "client_id")
    }
    
    // MARK: - clientSecret
    func test_clientSecret_shouldReturnClientSecret() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.clientSecret, "client_secret")
    }
    
    // MARK: - accessToken
    func test_accessToken_shouldReturnAccessToken() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.accessToken, "access_token")
    }
    
    // MARK: - query
    func test_query_shouldReturnQ() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.query, "q")
    }
    
    // MARK: - page
    func test_page_shouldReturnPage() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.page, "page")
    }
    
    // MARK: - perPage
    func test_perPage_shouldReturnPerPage() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.perPage, "per_page")
    }
    
    // MARK: - items
    func test_items_shouldReturnAccessToken() {
        
        // Given & When & Then
        XCTAssertEqual(GOAPIConstant.items, "items")
    }

}
