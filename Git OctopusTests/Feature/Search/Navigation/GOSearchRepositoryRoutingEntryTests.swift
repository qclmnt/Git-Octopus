//
//  GOSearchRepositoryRoutingEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOSearchRepositoryRoutingEntryTests: XCTestCase {

    // MARK: - navigationStyle
    func test_navigationStyle_shouldReturnModal() {
        
        // Given
        let routingEntry = self.getRoutingEntryForTest()
        
        // When & Then
        XCTAssertEqual(routingEntry.navigationStyle, .modal)
    }
    
    // MARK: - viewController
    func test_viewController_shouldReturnNavigationController_withSearchViewController() {
        
        // Given
        let routingEntry = self.getRoutingEntryForTest()
        
        // When
        let viewController = routingEntry.viewController as? GONavigationController
        
        // Then
        XCTAssert(viewController?.viewControllers.first is GOSearchRepositoryViewController)
    }
    
    // MARK: - Helper
    func getRoutingEntryForTest() -> GOSearchRepositoryRoutingEntry {
        return GOSearchRepositoryRoutingEntry()
    }

}
