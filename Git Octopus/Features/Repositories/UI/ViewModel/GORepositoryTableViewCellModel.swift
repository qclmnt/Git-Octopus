//
//  GORepositoryTableViewCellModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation
import QCViewModel

class GORepositoryTableViewCellModel: QCTableCellViewModel {
    
    // MARK: - Properties
    
    let repository: GORepository
    override var routingEntry: QCRoutingEntry? {
        get {
            return GORepositoryIssuesRoutingEntry(repository: self.repository)
        }
        set {}
    }
    
    // MARK: - Initialization
    
    init(repository: GORepository) {
        self.repository = repository
        super.init()
    }
    
    // MARK: - QCTableCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: GORepositoryTableViewCell.self)
    }
    
    override func configureCell(_ cell: UITableViewCell) {
        guard let repoCell = cell as? GORepositoryCellProtocol else {return}
        
        repoCell.fullNameLabel?.text = self.repository.fullName
        repoCell.descLabel?.text = self.repository.desc
        repoCell.languageLabel?.text = self.repository.language
        repoCell.languageColorView?.backgroundColor = GOLanguageColor.getColor(for: self.repository.language)
    }
    
    override func didSelect(fromVC: UIViewController?) {
        guard let routingEntry = self.routingEntry else {return}
        GOAppEnvironment.shared().routing?.route(to: routingEntry)
    }

}
