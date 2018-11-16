//
//  GOSearchRepositoryViewControllerViewModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation
import QCViewModel

class GOSearchRepositoryViewControllerViewModel: QCTableViewModel {
    
    var repositories: [GORepository]?
    weak var searchDelegate: GOSearchRepositoryDelegate?
    lazy var searchResultUpdater = GOSearchResultsUpdater(delegate: self)
    
    // MARK: - Initialization
    
    init(searchDelegate: GOSearchRepositoryDelegate?) {
        self.searchDelegate = searchDelegate
        super.init()
    }
    
    // MARK: - Properties
    
    var viewTitle: String {
        return NSLocalizedString("search", comment: "")
    }
    var searchBarPlaceholder: String {
        return NSLocalizedString("search.repository", comment: "")
    }
    
    lazy var cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(cancelSearch))
    
    // MARK: - QCTableViewModel
    
    override func loadSections() {
        self.sections = [GOSearchRepositoriesResultSection(repositories: self.repositories, searchDelegate: self.searchDelegate)]
    }
    
    // MARK: - Action
    
    @objc func cancelSearch() {
        GOAppEnvironment.shared().routing?.route(to: QCDismissRoutingEntry())
    }

}

extension GOSearchRepositoryViewControllerViewModel: GOSearchResultsUpdaterDelegate {
    
    // MARK: - Load with query
    
    func load(query: String?) {
        
        guard let query = query else {
            self.load()
            return
        }
        
        self.delegate?.viewModelDidStartLoad()
        let queryAPIEntry = GOGetSearchRepositoryAPIEntry(query: query,
                                                          page: 1,
                                                          resultPerPage: 25)

        GOAppEnvironment.shared().api?.request(with: queryAPIEntry, success: { (response) in
            
            guard let repositories = response as? [GORepository] else {return}
            
            self.repositories = repositories
            self.loadSections()
            
            self.delegate?.viewModelDidLoad()
        }, failure: nil)
    }
    
}
