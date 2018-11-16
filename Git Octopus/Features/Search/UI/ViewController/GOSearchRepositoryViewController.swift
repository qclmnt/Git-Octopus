//
//  GOSearchRepositoryViewController.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

import QCViewModel

class GOSearchRepositoryViewController: GOTableViewController {
    
    // MARK: - Properties
    
    override var goViewModel: QCTableViewModel? {
        return self.tableViewModel
    }
    let tableViewModel: GOSearchRepositoryViewControllerViewModel
    
    // MARK: - Initialization
    
    init(tableViewModel: GOSearchRepositoryViewControllerViewModel) {
        self.tableViewModel = tableViewModel
        super.init(nibName: String(describing: GOSearchRepositoryViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.tableViewModel = GOSearchRepositoryViewControllerViewModel(searchDelegate: nil)
        super.init(nibName: String(describing: GOSearchRepositoryViewController.self), bundle: nil)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.tableViewModel.viewTitle
        self.tableViewModel.delegate = self
        
        // Set up search controller
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self.tableViewModel.searchResultUpdater
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        
        // Set up search bar
        searchController.searchBar.placeholder = self.tableViewModel.searchBarPlaceholder
        searchController.searchBar.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = self.tableViewModel.cancelBarButtonItem
    }

}
