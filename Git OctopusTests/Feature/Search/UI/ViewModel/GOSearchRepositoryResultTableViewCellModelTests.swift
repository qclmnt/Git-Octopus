//
//  GOSearchRepositoryResultTableViewCellModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOSearchRepositoryResultTableViewCellModelTests: XCTestCase {

    // MARK: - watchRepoApiEntry
    func test_watchRepoApiEntry_shouldReturnPutWatchRepo() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When & Then
        XCTAssertNotNil(viewModel.watchRepoApiEntry)
    }
    
    // MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnRepositoryResultCell() {
        
        // Given
        let viewModel = self.getViewModelForTest()
        
        // When & Then
        XCTAssertEqual(viewModel.reuseIdentifier, String(describing: GOSearchRepositoryResultTableViewCell.self))
    }
    
    // MARK: - updateWatchStateOfTheRepo
    func test_updateWatchStateOfTheRepo_shouldCallPutWathRepositoryEntry_andCallDelegate() {
        
        // Given
        let delegate = GOMockSearchRepositoryDelegate()
        let viewModel = GOSearchRepositoryResultTableViewCellModel(repository: GORepositoryTableViewCellModelTests.getARepository(), searchDelegate: delegate)
        
        // When
        viewModel.updateWatchStateOfTheRepo(button: UIButton())
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOPutWatchRepositoryAPIEntry)
    }
    
    // MARK: - configureCellWatchButton
    
    func test_configureCellWatchButton_shouldSetBackgroundToLightGray_andTextToWatched_forWatchedRepo() {
        
        // Given
        let button = UIButton()
        let viewModel = self.getViewModelForTest()
        viewModel.repository.watched = true
        
        // When
        viewModel.configureCellWatchButton(button: button)
        
        // Then
        XCTAssertEqual(button.titleLabel?.text, NSLocalizedString("watched", comment: ""))
        XCTAssertEqual(button.backgroundColor, .appLightGray)
    }
    
    func test_configureCellWatchButton_shouldSetBackgroundToGray_andTextToWatch_forNotWatchedRepo() {
        
        // Given
        let button = UIButton()
        let viewModel = self.getViewModelForTest()
        viewModel.repository.watched = false
        
        // When
        viewModel.configureCellWatchButton(button: button)
        
        // Then
        XCTAssertEqual(button.titleLabel?.text, NSLocalizedString("watch", comment: ""))
        XCTAssertEqual(button.backgroundColor, .gray)
    }
    
    // MARK: - Helper
    func getViewModelForTest() -> GOSearchRepositoryResultTableViewCellModel {
        return GOSearchRepositoryResultTableViewCellModel(repository: GORepositoryTableViewCellModelTests.getARepository(), searchDelegate: nil)
    }

}
