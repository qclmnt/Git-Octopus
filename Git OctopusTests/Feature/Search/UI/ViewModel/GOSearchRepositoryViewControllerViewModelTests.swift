//
//  GOSearchRepositoryViewControllerViewModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

@testable import QCNavigation

class GOSearchRepositoryViewControllerViewModelTests: GOTestCase {

    // MARK: - viewTitle
    func test_viewTitle_shouldReturnSearch() {
        
        // Given & When & Then
        XCTAssertEqual(self.getViewModelForTest().viewTitle, NSLocalizedString("search", comment: ""))
    }
    
    // MARK: - searchBarPlaceholder
    func test_searchBarPlaceholder_shouldReturnSearchPlaceholder() {
        
        // Given & When & Then
        XCTAssertEqual(self.getViewModelForTest().searchBarPlaceholder, NSLocalizedString("search.repository", comment: ""))
    }
    
    // MARK: - loadSections
    func test_loadSections_shouldSetUpSections() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When
        viewModel.loadSections()
        
        // Then
        XCTAssertEqual(viewModel.sections.count, 1)
    }
    
    // MARK: - load
    func test_load_shouldCallGetSearchRepository() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When
        viewModel.load(query: "query")
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOGetSearchRepositoryAPIEntry)
    }
    
    // MARK: - cancelSearch
    func test_cancelSearch_shouldRouteToDismiss() {

        // Given
        let viewModel = self.getViewModelForTest()

        // When
        viewModel.cancelSearch()

        // Then
        XCTAssert(GOAppEnvironment.shared().routing?.lastRoutingEntry is QCDismissRoutingEntry)
    }
    
    // MARK: - Helper
    func getViewModelForTest() -> GOSearchRepositoryViewControllerViewModel {
        return GOSearchRepositoryViewControllerViewModel(searchDelegate: nil)
    }

}
