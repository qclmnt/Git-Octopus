//
//  GODeleteWatchRepositoryAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GODeleteWatchRepositoryAPIEntryTests: XCTestCase {

    // MARK: - method
    func test_method_shouldReturnDelete() {
        
        // Given
        let apiEntry = GODeleteWatchRepositoryAPIEntry(repoFullName: "fullName")
        
        // When & Then
        XCTAssertEqual(apiEntry.method, .delete)
    }
    
    // MARK: - path
    func test_path_shouldReturnUserSubscriptionRepoFullName() {
        
        // Given
        let repoFullName = "repoFullName"
        let apiEntry = GODeleteWatchRepositoryAPIEntry(repoFullName: repoFullName)
        
        // When & Then
        XCTAssertEqual(apiEntry.path, "user/subscriptions/\(repoFullName)?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")")
    }

}
