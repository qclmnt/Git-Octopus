//
//  GOSearchResultsUpdaterTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOSearchResultsUpdaterTests: XCTestCase {

    // MARK: - init
    func test_init_shouldSetProperties() {
        
        // Given
        let delegate = GOMockSearchResultsUpdaterDelegate()
        
        // When
        let updater = GOSearchResultsUpdater(delegate: delegate)
        
        // Then
        XCTAssertNotNil(updater.delegate)
    }
    
    // MARK: - updateSearchResults
    func test_updateSearchResults_shouldCallDelegateAfter0dot6sec() {
        
        // Given
        let delegate = GOMockSearchResultsUpdaterDelegate()
        let updater = GOSearchResultsUpdater(delegate: delegate)
        
        weak var localExpectation = self.expectation(description: "test_updateSearchResults_shouldCallDelegateAfter0dot6sec")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            // Then
            XCTAssert(delegate.loadCalled)
            localExpectation?.fulfill()
            localExpectation = nil
        }
        
        // When
        updater.updateSearchResults(for: UISearchController(searchResultsController: nil))
        
        wait(for: [localExpectation!], timeout: 2, enforceOrder: true)
    }

}
