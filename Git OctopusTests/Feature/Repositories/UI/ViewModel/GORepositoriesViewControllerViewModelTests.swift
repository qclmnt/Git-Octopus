//
//  GORepositoriesViewControllerViewModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GORepositoriesViewControllerViewModelTests: GOTestCase {
    
    // MARK: - load
    func test_load_shouldCallGetUserSubscriptionEntry_andCallDelegate() {
        
        // Given
        let viewModel = self.getRepositoriesTableViewModel()
        
        // When
        viewModel.load()
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOGetUserSubscriptionsAPIEntry)
    }
    
    // MARK: - loadSections()
    func test_loadSections_shouldCreateOneSection() {
        
        // Given
        let viewModel = self.getRepositoriesTableViewModel()
        viewModel.repositories = [GORepository]()
        
        // When
        viewModel.loadSections()
        
        // Then
        XCTAssertEqual(viewModel.sections.count, 1)
        XCTAssert(viewModel.sections.first is GORepositoriesSection)
    }
    
    // MARK: - searchForRepository
    func test_searchForRepository_shouldRouteToSearchRepositoryRoutingEntry() {
        
        // Given
        let viewModel = self.getRepositoriesTableViewModel()
        
        // When
        viewModel.searchForRepository()
        
        // Then
        XCTAssert(GOAppEnvironment.shared().routing?.lastRoutingEntry is GOSearchRepositoryRoutingEntry)
    }
    
    // MARK: - unwatchARepository
    func test_unwatchARepository_shouldCallDeleteWatchRepository() {
        
        // Given
        let viewModel = self.getRepositoriesTableViewModel()
        viewModel.repositories = [GORepositoryTableViewCellModelTests.getARepository()]
        
        // When
        viewModel.unwatchARepository(indexPath: IndexPath(item: 0, section: 0))
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GODeleteWatchRepositoryAPIEntry)
    }

    // MARK: - Helper
    func getRepositoriesTableViewModel() -> GORepositoriesViewControllerViewModel {
        return GORepositoriesViewControllerViewModel()
    }

}
