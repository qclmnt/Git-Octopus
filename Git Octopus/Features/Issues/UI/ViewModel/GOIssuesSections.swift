//
//  GOIssuesSections.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

class GOIssuesSections: QCTableSection {
    
    // MARK: - Properties
    
    let issues: [GOIssue]
    
    // MARK: - Initialization
    
    init(issues: [GOIssue]) {
        self.issues = issues
        super.init()
        self.reloadItemsInSection()
    }
    
    // MARK: - QCSection
    
    override func reloadItemsInSection() {
        var issuesCellModel = [GOIssueTableViewCellModel]()
        
        for issue in self.issues {
            issuesCellModel.append(GOIssueTableViewCellModel(issue: issue))
        }

        self.items = issuesCellModel
    }

}
