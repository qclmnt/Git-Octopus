//
//  GORepositoriesViewController.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

import QCViewModel

class GORepositoriesViewController: GOTableViewController {
    
    // MARK: - Properties
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self.tableViewModel, action:
            #selector(GORepositoriesViewControllerViewModel.load),
                                 for: .valueChanged)
        refreshControl.tintColor = .white
        
        return refreshControl
    }()
    
    override var goViewModel: QCTableViewModel? {
        return self.tableViewModel
    }
    lazy var tableViewModel: GORepositoriesViewControllerViewModel = {
        let vm = GORepositoriesViewControllerViewModel()
        vm.delegate = self
        return vm
    }()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.tableViewModel.viewTitle
        self.navigationItem.rightBarButtonItem = self.tableViewModel.searchRepositoryBarButtonItem
        self.navigationItem.leftBarButtonItem = self.tableViewModel.settingsRepositoryBarButtonItem
        self.tableView?.refreshControl = self.refreshControl
        self.tableViewModel.load()
    }
    
}
