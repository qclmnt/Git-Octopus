//
//  GORepositoriesViewControllerViewModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation
import QCViewModel

class GORepositoriesViewControllerViewModel: QCTableViewModel {
    
    // MARK: - Properties
    
    var viewTitle: String {
        return NSLocalizedString("repositories", comment: "")
    }
    lazy var apiEntry = GOGetUserSubscriptionsAPIEntry()
    var repositories: [GORepository]?
    
    lazy var searchRepositoryBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(searchForRepository))
    lazy var settingsRepositoryBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .done, target: self, action: #selector(showSettings))
    lazy var searchRepositoryRoutingEntry: GOSearchRepositoryRoutingEntry = GOSearchRepositoryRoutingEntry(searchDelegate: self)
    
    // MARK: - QCViewModel
    
    @objc override func load() {
        self.delegate?.viewModelDidStartLoad()
        GOAppEnvironment.shared().api?.request(with: self.apiEntry, success: { (response) in
            guard let repositories = response as? [GORepository] else {return}
            
            self.repositories = repositories
            self.loadSections()
            self.delegate?.viewModelDidLoad()
        }, failure: nil)
    }
    
    // MARK: - QCScrollViewViewModel
    
    override func loadSections() {
        guard let repos = self.repositories else {return}
        self.sections = [GORepositoriesSection(repositories: repos)]
    }
    
    // MARK: - Search repository

    @objc func searchForRepository() {
        GOAppEnvironment.shared().routing?.route(to: self.searchRepositoryRoutingEntry)
    }
    
    // MARK: - Settings
    
    @objc func showSettings() {
        
        let signOutAction = UIAlertAction(title: NSLocalizedString("signout", comment: ""),
                                          style: .destructive) { (action) in
                                      
                                            GOAppEnvironment.shared().session?.signOut()
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""),
                                          style: .cancel) { (action) in
                                            
                                            GOAppEnvironment.shared().routing?.route(to: QCDismissRoutingEntry())
        }
        
        let routingEntry = GOAlertRoutingEntry(title: nil, message: nil, alertActions: [signOutAction, cancelAction])
        GOAppEnvironment.shared().routing?.route(to: routingEntry)
    }
    
    // MARK: - Unwatch
    
    func unwatchARepository(indexPath: IndexPath) {
        
        guard let repos = self.repositories,
            indexPath.row < repos.count else { return }
        
        let repository = repos[indexPath.row]
        
        guard let repoFullName = repository.fullName else { return }
        
        let apiEntry = GODeleteWatchRepositoryAPIEntry(repoFullName: repoFullName)
        
        GOAppEnvironment.shared().api?.request(with: apiEntry, success: { (success) in
            if (success) {
                self.repositories?.remove(at: indexPath.row)
                self.loadSections()
                self.tvDelegate?.deleteRows(indexPaths: [indexPath])
            }
        })
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let unwatch = UITableViewRowAction(style: .destructive,
                                           title: NSLocalizedString("unwatch", comment: "")) { (action, indexPath) in
            self.unwatchARepository(indexPath: indexPath)
        }
        return [unwatch]
    }
}

extension GORepositoriesViewControllerViewModel: GOSearchRepositoryDelegate {
    
    func userWatchedARepository() {
        self.load()
    }
}
