//
//  GOGetUserSubscriptionsAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOGetUserSubscriptionsAPIEntryTests: XCTestCase {

    // MARK: - basePath
    func test_basePath_shouldReturnApiGitHub() {
        
        // Given
        let apiEntry = self.getApiEntryForTest()
        
        // When & Then
        XCTAssertEqual(apiEntry.basePath, "https://api.github.com")
    }
    
    // MARK: - path
    func test_path_shouldReturnApiGitHub() {
        
        // Given
        let apiEntry = self.getApiEntryForTest()

        // When & Then
        XCTAssertEqual(apiEntry.path, "user/subscriptions?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")")
    }
    
    // MARK: - parsing
    func test_parsing_shouldReturnListOfRepositories_whenReceiveJsonOfRepositories() {
        
        // Given
        let jsonObject = [["full_name": "Repo1"],["full_name": "Repo2"]]
        let apiEntry = self.getApiEntryForTest()
        
        // When
        let repositories = apiEntry.parsing(responseObject: jsonObject) as? [GORepository]
        
        // Then
        XCTAssertEqual(repositories?.count, 2)
    }
    
    // MARK: - Helper
    func getApiEntryForTest() -> GOGetUserSubscriptionsAPIEntry {
        return GOGetUserSubscriptionsAPIEntry()
    }

}
