//
//  GORepositoryIssuesRoutingEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GORepositoryIssuesRoutingEntryTests: XCTestCase {

    // MARK: - viewController
    func test_viewController_shouldReturnRepositoryIssuesViewController() {
        
        // Given
        let routingEntry = GORepositoryIssuesRoutingEntry(repository: GORepositoryTableViewCellModelTests.getARepository())
        
        // When & Then
        XCTAssert(routingEntry.viewController is GORepositoryIssuesViewController)
    }

}
