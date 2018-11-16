//
//  GOParserTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOParserTests: XCTestCase {

    // MARK: - parse<T: Codable>
    func test_parse_shouldReturnArrayOfRepository_whenGiveJsonOfRepositories_andRepositoryType() {
        
        // Given
        let jsonRepositories = [["full_name": "Repo 1"], ["full_name": "Repo 2"]]
        
        // When
        let repositories = GOParser.parse(array: jsonRepositories, type: GORepository.self)
        
        // Then
        XCTAssertEqual(repositories.count, 2)
    }

}
