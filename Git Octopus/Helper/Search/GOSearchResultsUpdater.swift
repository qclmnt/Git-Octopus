//
//  GOSearchResultsUpdater.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

protocol GOSearchResultsUpdaterDelegate: class {
    func load(query: String?)
}

class GOSearchResultsUpdater: NSObject, UISearchResultsUpdating {
    
    // MARK: - Properties
    
    weak var delegate: GOSearchResultsUpdaterDelegate?
    var searchTimer: Timer?
    
    // MARK: - Initialization
    
    init(delegate: GOSearchResultsUpdaterDelegate?) {
        self.delegate = delegate
        super.init()
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.searchTimer?.invalidate()
        self.searchTimer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
            self.delegate?.load(query: searchController.searchBar.text)
        }
        
    }
    
}
