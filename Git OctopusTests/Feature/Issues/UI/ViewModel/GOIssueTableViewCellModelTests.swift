//
//  GOIssueTableViewCellModelTests.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest

@testable import Git_Octopus

class GOIssueTableViewCellModelTests: XCTestCase {

    // MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnIssueCell() {
        
        // Given
        let cellModel = self.getCellModel()
        
        // When & Then
        XCTAssertEqual(cellModel.reuseIdentifier, String(describing: GOIssueTableViewCell.self))
    }
    
    // MARK: - cellHeight
    func test_cellHeight_shouldReturn65() {
        
        // Given
        let cellModel = self.getCellModel()
        
        // When & Then
        XCTAssertEqual(cellModel.cellHeight(.zero), 65)
    }
    
    // MARK: - Helper
    
    class func getAnIssue() -> GOIssue {
        var issue: GOIssue?
        let decoder = JSONDecoder()
        do {
            let dataToParse = try JSONSerialization.data(withJSONObject: [GOIssue.CodingKeys.title.rawValue: "Issue Test"], options: [])
            let i = try decoder.decode(GOIssue.self, from: dataToParse)
            issue = i
        } catch {
            
        }
        return issue!
    }
    
    func getCellModel() -> GOIssueTableViewCellModel {
        return GOIssueTableViewCellModel(issue: GOIssueTableViewCellModelTests.getAnIssue())
    }
}
