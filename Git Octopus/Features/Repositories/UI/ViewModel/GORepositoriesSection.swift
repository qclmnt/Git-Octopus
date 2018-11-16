//
//  GORepositoriesSection.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

class GORepositoriesSection: QCTableSection {
    
    // MARK: - Properties
    
    let repositories: [GORepository]?
    
    // MARK: - Initialization
    
    init(repositories: [GORepository]?) {
        self.repositories = repositories
        super.init()
        
        self.reloadItemsInSection()
    }
    
    // MARK: - QCSection
    
    override func reloadItemsInSection() {
        var repositoriesCellModel = [GORepositoryTableViewCellModel]()
        
        if let repositories = self.repositories {
            for repo in repositories {
                repositoriesCellModel.append(self.getCellModel(repository: repo))
            }
        }
        
        self.items = repositoriesCellModel
    }
    
    // MARK: - CellModel
    
    func getCellModel(repository: GORepository) -> GORepositoryTableViewCellModel {
        return GORepositoryTableViewCellModel(repository: repository)
    }
    
}
