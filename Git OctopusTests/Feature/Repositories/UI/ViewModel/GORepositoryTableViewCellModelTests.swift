//
//  GORepositoryTableViewCellModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GORepositoryTableViewCellModelTests: XCTestCase {
    
    // MARK: - init
    func test_init_shouldSetProperties() {
        
        // Given
        let repo = GORepositoryTableViewCellModelTests.getARepository()
        
        // When
        let viewModel = GORepositoryTableViewCellModel(repository: repo)
        
        // Then
        XCTAssertEqual(viewModel.repository.fullName, repo.fullName)
    }
    
    // MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnRepositoryTableViewCell() {
        
        // Given
        let viewModel = self.getTableCellModelForTest()
        
        // When & Then
        XCTAssertEqual(viewModel.reuseIdentifier, String(describing: GORepositoryTableViewCell.self))
    }

    // MARK: - Helper
    
    class func getARepository() -> GORepository {
        var repository: GORepository?
        let decoder = JSONDecoder()
        do {
            let dataToParse = try JSONSerialization.data(withJSONObject: [GORepository.CodingKeys.fullName.rawValue: "Repo Test"], options: [])
            let repo = try decoder.decode(GORepository.self, from: dataToParse)
            repository = repo
        } catch {
            
        }
        return repository!
    }
    
    func getTableCellModelForTest() -> GORepositoryTableViewCellModel {
        let repo = GORepositoryTableViewCellModelTests.getARepository()
        return GORepositoryTableViewCellModel(repository: repo)
    }

}
