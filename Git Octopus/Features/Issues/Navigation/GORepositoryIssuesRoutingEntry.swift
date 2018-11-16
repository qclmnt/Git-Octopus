//
//  GORepositoryIssuesRoutingEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

struct GORepositoryIssuesRoutingEntry: QCRoutingEntry {
    
    // MARK: - Properties
    
    let repository: GORepository
    
    // MARK: - QCRoutingEntry
    
    var viewController: UIViewController? {
        let viewModel = GORepositoryIssuesViewControllerViewModel(repository: self.repository)
        return GORepositoryIssuesViewController(viewModel: viewModel)
    }

}
