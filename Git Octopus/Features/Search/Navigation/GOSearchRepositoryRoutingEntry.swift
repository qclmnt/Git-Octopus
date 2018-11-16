//
//  GOSearchRepositoryRoutingEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

struct GOSearchRepositoryRoutingEntry: QCRoutingEntry {
    
    // MARK: - Properties
    
    weak var searchDelegate: GOSearchRepositoryDelegate?
    
    // MARK: - QCRoutingEntry
    
    var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    var viewController: UIViewController? {
        let viewModel = GOSearchRepositoryViewControllerViewModel(searchDelegate: self.searchDelegate)
        let viewController = GOSearchRepositoryViewController(tableViewModel: viewModel)
        return GONavigationController(rootViewController: viewController)
    }

}
