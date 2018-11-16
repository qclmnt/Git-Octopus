//
//  GOSearchRepositoriesResultSection.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GOSearchRepositoriesResultSection: GORepositoriesSection {
    
    weak var searchDelegate: GOSearchRepositoryDelegate?
    
    // MARK: - Initialization
    
    init(repositories: [GORepository]?,
         searchDelegate: GOSearchRepositoryDelegate?) {
        self.searchDelegate = searchDelegate
        super.init(repositories: repositories)
    }

    override func getCellModel(repository: GORepository) -> GORepositoryTableViewCellModel {
        return GOSearchRepositoryResultTableViewCellModel(repository: repository, searchDelegate: self.searchDelegate)
    }
}
