//
//  GORepositoryTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GORepositoryTests: XCTestCase {

    // MARK: - CodingKeys
    func test_CodingKeys_shouldReturnGoodString_forKey() {
        
        // Given & When & Then
        XCTAssertEqual(GORepository.CodingKeys.fullName.rawValue, "full_name")
        XCTAssertEqual(GORepository.CodingKeys.desc.rawValue, "description")
        XCTAssertEqual(GORepository.CodingKeys.starsCount.rawValue, "stargazers_count")
        XCTAssertEqual(GORepository.CodingKeys.language.rawValue, "language")
        
    }

}
