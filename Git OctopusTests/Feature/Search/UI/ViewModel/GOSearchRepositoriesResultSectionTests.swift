//
//  GOSearchRepositoriesResultSectionTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOSearchRepositoriesResultSectionTests: XCTestCase {

    // MARK: - getCellModel
    func test_getCellModel_shouldReturnSearchResultCell() {
        
        // Given
        let section = GOSearchRepositoriesResultSection(repositories: nil, searchDelegate: nil)
        
        // When & Then
        XCTAssert(section.getCellModel(repository: GORepositoryTableViewCellModelTests.getARepository()) is GOSearchRepositoryResultTableViewCellModel)
    }

}
