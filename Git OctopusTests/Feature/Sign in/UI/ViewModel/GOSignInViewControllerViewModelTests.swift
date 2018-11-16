//
//  GOSignInViewControllerViewModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import Git_Octopus

class GOSignInViewControllerViewModelTests: XCTestCase {

    // MARK: - signInTitle
    func test_signInTitle_shouldReturnSignInTitle() {
        // Given
        let viewModel = self.getSignInViewModelForTests()
        
        // When & Then
        XCTAssertEqual(viewModel.signInTitle, NSLocalizedString("signIn.title", comment: ""))
    }
    
    // MARK: - signInSubtitle
    func test_signInSubtitle_shouldReturnSignInSubtitle() {
        // Given
        let viewModel = self.getSignInViewModelForTests()
        
        // When & Then
        XCTAssertEqual(viewModel.signInSubtitle, NSLocalizedString("signIn.subtitle", comment: ""))
    }
    
    // MARK: - signInButtonTitle
    func test_signInButtonTitle_shouldReturnSignInButtonTitle() {
        // Given
        let viewModel = self.getSignInViewModelForTests()
        
        // When & Then
        XCTAssertEqual(viewModel.signInButtonTitle, NSLocalizedString("signIn.button.title", comment: ""))
    }
    
    // MARK: - loginUrl
    func test_loginUrl_shouldReturnLoginUrl() {
        // Given
        let viewModel = self.getSignInViewModelForTests()
        
        // When & Then
        XCTAssertEqual(viewModel.loginUrl, URL(string: GOGitHubConstant.loginUrlString))
    }
    
    // MARK: - getGithubAccessToken
    func test_getGithubAccessToken_shouldCallPostGitHubAccessTokenApiEntry() {
        // Given
        let viewModel = self.getSignInViewModelForTests()
        
        // When
        viewModel.getGithubAccessToken(code: "code")
        
        // Then
        XCTAssert(GOAppEnvironment.shared().api?.lastWebServicesEntry is GOPostGitHubAccessTokenApiEntry)
    }
    
    // MARK: - Helper
    func getSignInViewModelForTests() -> GOSignInViewControllerViewModel {
        return GOSignInViewControllerViewModel()
    }

}
