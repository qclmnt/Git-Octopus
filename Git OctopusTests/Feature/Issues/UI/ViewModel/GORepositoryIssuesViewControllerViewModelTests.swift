//
//  GORepositoryIssuesViewControllerViewModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GORepositoryIssuesViewControllerViewModelTests: XCTestCase {

    // MARK: - repositoryIssuesApiEntry
    func test_repositoryIssuesApiEntry_shouldReturnNotNil() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When & Then
        XCTAssertNotNil(viewModel.repositoryIssuesApiEntry)
    }
    
    // MARK: - searchBarPlaceholder
    func test_searchBarPlaceholder_shouldReturnSearchIssue() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When & Then
        XCTAssertEqual(viewModel.searchBarPlaceholder, NSLocalizedString("search.issue", comment: ""))
    }
    
    // MARK: - load
    func test_load_shouldCallRepositoryIssuesApiEntry() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When
        viewModel.load()
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOGetRepositoryIssuesAPIEntry)
    }
    
    // MARK: - loadSections
    func test_loadSections_shouldCreateIssueSection() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        viewModel.issues = [GOIssue]()
        
        // When
        viewModel.loadSections()
        
        // Then
        XCTAssertEqual(viewModel.sections.count, 1)
        XCTAssert(viewModel.sections.first is GOIssuesSections)
    }
    
    // MARK: - load:query
    func test_load_with_query_shouldCallRepositoryIssuesApiEntry() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When
        viewModel.load(query: "query")
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOSearchIssueInRepositoryAPIEntry)
    }
    
    // MARK: - Helper
    func getViewModelForTest() -> GORepositoryIssuesViewControllerViewModel {
        return GORepositoryIssuesViewControllerViewModel(repository: GORepositoryTableViewCellModelTests.getARepository())
    }

}
