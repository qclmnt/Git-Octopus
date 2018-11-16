//
//  GOAppSessionTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOAppSessionTests: XCTestCase {

    // MARK: - accessToken
    func test_accessToken_set_shouldSetAccessTokenWithoutAccessKeychain() {
        
        // Given
        let session = GOAppSession()
        let accessToken = "accessToken"
        
        // When
        session.accessToken = accessToken
        
        // Then
        XCTAssertEqual(session.accessTokenWithoutAccessingKeychain, accessToken)
    }
    
    // MARK: - signOut
    func test_signOut_shouldSetAccessTokenToNil() {
        
        // Given
        let session = GOAppSession()
        session.accessToken = "accessToken"
        
        // When
        session.signOut()
        
        // Then
        XCTAssertNil(session.accessToken)
    }

}
