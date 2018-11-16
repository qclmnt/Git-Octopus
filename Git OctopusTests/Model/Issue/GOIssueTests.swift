//
//  GOIssueTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOIssueTests: XCTestCase {

    // MARK: - CodingKeys
    func test_CodingKeys_shouldReturnGoodString_forKey() {
        
        // Given & When & Then
        XCTAssertEqual(GOIssue.CodingKeys.title.rawValue, "title")
        XCTAssertEqual(GOIssue.CodingKeys.state.rawValue, "state")
        XCTAssertEqual(GOIssue.CodingKeys.commentsCount.rawValue, "comments")
        XCTAssertEqual(GOIssue.CodingKeys.updateAt.rawValue, "updated_at")
        
    }

}
