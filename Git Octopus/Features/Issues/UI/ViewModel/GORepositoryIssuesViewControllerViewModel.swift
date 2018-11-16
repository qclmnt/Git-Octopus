//
//  GORepositoryIssuesViewControllerViewModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

class GORepositoryIssuesViewControllerViewModel: QCTableViewModel {
    
    // MARK: - Properties
    
    let repository: GORepository
    lazy var repositoryIssuesApiEntry: GOGetRepositoryIssuesAPIEntry? = {
        guard let repoFullName = self.repository.fullName else {return nil}
        return GOGetRepositoryIssuesAPIEntry(repoFullName: repoFullName)
    }()
    var issues: [GOIssue]?
    lazy var searchResultUpdater = GOSearchResultsUpdater(delegate: self)
    
    var searchBarPlaceholder: String {
        return NSLocalizedString("search.issue", comment: "")
    }
    
    // MARK: - Initialization
    
    init(repository: GORepository) {
        self.repository = repository
        super.init()
    }
    
    // MARK: - QCViewModel
    
    override func load() {
        guard let repositoryIssuesApiEntry = self.repositoryIssuesApiEntry else {return}
        self.delegate?.viewModelDidStartLoad()
        
        GOAppEnvironment.shared().api?.request(with: repositoryIssuesApiEntry, success: { (response) in
            guard let issues = response as? [GOIssue] else {return}
            self.issues = issues
            
            self.loadSections()
            self.delegate?.viewModelDidLoad()
        }, failure: nil)
    }
    
    override func loadSections() {
        guard let issues = self.issues else {return}
        self.sections = [GOIssuesSections(issues: issues)]
    }
    
}

extension GORepositoryIssuesViewControllerViewModel: GOSearchResultsUpdaterDelegate {
    
    func load(query: String?) {
        
        guard let query = query else {
            self.load()
            return
        }
        
        guard let repoFullName = self.repository.fullName else {return}
        
        self.delegate?.viewModelDidStartLoad()
        let queryAPIEntry = GOSearchIssueInRepositoryAPIEntry(query: query, repoFullName: repoFullName)
        
        GOAppEnvironment.shared().api?.request(with: queryAPIEntry, success: { (response) in
            
            guard let issues = response as? [GOIssue] else {return}
            
            self.issues = issues
            self.loadSections()
            
            self.delegate?.viewModelDidLoad()
        }, failure: nil)
        
    }
    
}
