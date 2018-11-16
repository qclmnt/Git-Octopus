//
//  GOGetRepositoryIssuesAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOGetRepositoryIssuesAPIEntryTests: XCTestCase {

    // MARK: - parsing
    func test_parsing_shouldReturnArrayOfIssues() {
        
        // Given
        let jsonIssues = [["title": "title 1"], ["title": "title 2"]]
        let apiEntry = GOGetRepositoryIssuesAPIEntry(repoFullName: "name")
        
        // When
        let issues = apiEntry.parsing(responseObject: jsonIssues) as? [GOIssue]
        
        // Then
        XCTAssertEqual(issues?.count, 2)
    }

}
