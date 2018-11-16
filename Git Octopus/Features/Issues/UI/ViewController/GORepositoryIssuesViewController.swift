//
//  GORepositoryIssuesViewController.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

import QCViewModel

class GORepositoryIssuesViewController: GOTableViewController {
    
    // MARK: - Properties
    
    override var goViewModel: QCTableViewModel? {
        return self.tableViewModel
    }
    let tableViewModel: GORepositoryIssuesViewControllerViewModel?
    
    // MARK: - Initialization
    
    init(viewModel: GORepositoryIssuesViewControllerViewModel) {
        self.tableViewModel = viewModel
        super.init(nibName: String(describing: GORepositoryIssuesViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.tableViewModel = nil
        super.init(nibName: String(describing: GORepositoryIssuesViewController.self), bundle: nil)
    }

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.tableViewModel?.repository.fullName
        self.tableViewModel?.delegate = self
        self.tableViewModel?.load()
        
        // Set up search controller
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self.tableViewModel?.searchResultUpdater
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        
        // Set up search bar
        searchController.searchBar.placeholder = self.tableViewModel?.searchBarPlaceholder
        searchController.searchBar.tintColor = .white
    }

}
