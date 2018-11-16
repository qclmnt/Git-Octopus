//
//  GORepositoriesSectionTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GORepositoriesSectionTests: XCTestCase {
    
    // MARK: - init
    func test_init_shouldSetProperties_andSetItems() {
        
        // Given
        let repositories = [GORepository]()
        
        // When
        let section = GORepositoriesSection(repositories: repositories)
        
        // Then
        XCTAssertEqual(section.repositories?.count, repositories.count)
        XCTAssertNotNil(section.items)
    }
    
    // MARK: - reloadItemsInSection
    func test_reloadItemsInSection_shouldSetItems() {
        
        // Given
        let section = self.getSectionForTest()
        
        // When & Then
        XCTAssertNotNil(section.items)
    }
    
    // MARK: - getCellModel
    func test_getCellModel_shouldReturnRepositoryCell() {
        
        // Given
        let section = self.getSectionForTest()
        
        // When & Then
        XCTAssert(section.getCellModel(repository: GORepositoryTableViewCellModelTests.getARepository()) is GORepositoryTableViewCellModel)
    }

    // MARK: - Helper
    func getSectionForTest() -> GORepositoriesSection {
        let repositories = [GORepository]()
        return GORepositoriesSection(repositories: repositories)
    }

}
