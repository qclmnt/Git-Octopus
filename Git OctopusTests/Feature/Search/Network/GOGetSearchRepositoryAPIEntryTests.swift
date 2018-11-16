//
//  GOGetSearchRepositoryAPIEntryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOGetSearchRepositoryAPIEntryTests: XCTestCase {

    // MARK: - path
    func test_path_shouldReturnSearchRepositories() {
        
        // Given
        let apiEntry = self.getApiEntryForTest()
        
        // When & Then
        XCTAssertEqual(apiEntry.path, "search/repositories")
    }
    
    // MARK: - entryParameters
    func test_entryParameters_shouldReturnQuery_Page_andPerPage() {
        
        // Given
        let query = "Insta"
        let page = 1
        let resultPerPage = 25
        let apiEntry = self.getApiEntryForTest()
        
        // When
        let params = apiEntry.entryParameters
        
        // Then
        XCTAssertEqual(params?[GOAPIConstant.query] as? String, query.lowercased())
        XCTAssertEqual(params?[GOAPIConstant.page] as? Int, page)
        XCTAssertEqual(params?[GOAPIConstant.perPage] as? Int, resultPerPage)
    }
    
    // MARK: - parsing
    func test_parsing_shouldReturnArrayOfRepositories() {
        
        // Given
        let jsonResponse = [GOAPIConstant.items: [[GORepository.CodingKeys.fullName.rawValue: "Repo A"]]]
        let apiEntry = self.getApiEntryForTest()
        
        // When
        let response = apiEntry.parsing(responseObject: jsonResponse) as? [GORepository]
        
        // Then
        XCTAssertEqual(response?.count, 1)
    }
    
    // MARK: - Helper
    func getApiEntryForTest() -> GOGetSearchRepositoryAPIEntry {
        return GOGetSearchRepositoryAPIEntry(query: "Insta",
                                             page: 1,
                                             resultPerPage: 25)
    }

}
