//
//  GOPutWatchRepositoryAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOPutWatchRepositoryAPIEntryTests: XCTestCase {
    
    // MARK: - method
    func test_method_shouldReturnPut() {
        
        // Given
        let apiEntry = self.getApiEntryForTest()
        
        // When & Then
        XCTAssertEqual(apiEntry.method, .put)
    }

    // MARK: - path
    func test_path_shouldReturnReposFullNameSubscription() {
        
        // Given
        let repoFullName = "repoFullName"
        let apiEntry = GOPutWatchRepositoryAPIEntry(repoFullName: repoFullName)
        
        // When & Then
        XCTAssertEqual(apiEntry.path, "repos/\(repoFullName)/subscription?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")")
    }
    
    // MARK: - Helper
    func getApiEntryForTest() -> GOPutWatchRepositoryAPIEntry {
        return GOPutWatchRepositoryAPIEntry(repoFullName: "repoFullName")
    }

}
