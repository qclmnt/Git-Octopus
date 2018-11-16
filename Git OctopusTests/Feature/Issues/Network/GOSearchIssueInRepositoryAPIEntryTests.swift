//
//  GOSearchIssueInRepositoryAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOSearchIssueInRepositoryAPIEntryTests: XCTestCase {
    
    // MARK: - path
    func test_path_shouldReturnSearchIssues() {
     
        // Given
        let apiEntry = self.getApiEntryForTest()
        
        // When & Then
        XCTAssertEqual(apiEntry.path, "search/issues")
    }
    
    // MARK: - entryParameters
    func test_entryParameters_shouldReturnQueryWithRepoAndTitle() {
        
        // Given
        let query = "work"
        let repoFullname = "name"
        let apiEntry = GOSearchIssueInRepositoryAPIEntry(query: query, repoFullName: repoFullname)
        
        // When
        let params = apiEntry.entryParameters
        
        // Then
        XCTAssertEqual(params?[GOAPIConstant.query] as? String, "\(query)+repo:\(repoFullname)+in:title")
    }

    // MARK: - parsing
    func test_parsing_shouldReturnArrayOfIssues() {
        
        // Given
        let jsonIssues = [GOAPIConstant.items: [["title": "title 1"], ["title": "title 2"]]]
        let apiEntry = self.getApiEntryForTest()
        
        // When
        let issues = apiEntry.parsing(responseObject: jsonIssues) as? [GOIssue]
        
        // Then
        XCTAssertEqual(issues?.count, 2)
    }
    
    // MARK: - Helper
    func getApiEntryForTest() -> GOSearchIssueInRepositoryAPIEntry {
        return GOSearchIssueInRepositoryAPIEntry(query: "query", repoFullName: "name")
    }

}
