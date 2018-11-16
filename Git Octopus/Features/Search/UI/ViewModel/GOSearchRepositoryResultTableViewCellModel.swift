//
//  GOSearchRepositoryResultTableViewCellModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GOSearchRepositoryResultTableViewCellModel: GORepositoryTableViewCellModel {
    
    lazy var watchRepoApiEntry: GOPutWatchRepositoryAPIEntry? = {
        guard let repoFullName = self.repository.fullName else {return nil}
        return GOPutWatchRepositoryAPIEntry(repoFullName: repoFullName)
    }()
    lazy var unwatchRepoApiEntry: GODeleteWatchRepositoryAPIEntry? = {
        guard let repoFullName = self.repository.fullName else {return nil}
        return GODeleteWatchRepositoryAPIEntry(repoFullName: repoFullName)
    }()
    
    weak var searchDelegate: GOSearchRepositoryDelegate?
    
    // MARK: - Initialization
    
    init(repository: GORepository,
         searchDelegate: GOSearchRepositoryDelegate?) {
        self.searchDelegate = searchDelegate
        super.init(repository: repository)
    }
    
    // MARK: - QCCellModel
    
    override var reuseIdentifier: String {
        return String(describing: GOSearchRepositoryResultTableViewCell.self)
    }
    
    override func configureCell(_ cell: UITableViewCell) {
        super.configureCell(cell)
        
        guard let repoCell = cell as? GOSearchRepositoryResultTableViewCell,
            let starsCount = self.repository.starsCount else {return}
        repoCell.starsCountLabel.text = "\(starsCount)"
        repoCell.watchButton.setTitle(NSLocalizedString("watch", comment: ""), for: .normal)
        repoCell.viewModel = self
        self.configureCellWatchButton(button: repoCell.watchButton)
    }
    
    func configureCellWatchButton(button: UIButton?) {
        button?.backgroundColor = self.repository.watched ? UIColor.appLightGray : .gray
        button?.setTitle(NSLocalizedString(self.repository.watched ? "watched" : "watch", comment: ""), for: .normal)
    }
    
    // MARK: - Action
    
    func updateWatchStateOfTheRepo(button: UIButton) {
        
        let watched = self.repository.watched
        guard let entry = watched ? self.unwatchRepoApiEntry : self.watchRepoApiEntry else {return}
        
        GOAppEnvironment.shared().api?.request(with: entry, success: { (success) in
            if success {
                self.repository.watched = !watched
                self.configureCellWatchButton(button: button)
                self.searchDelegate?.userWatchedARepository()
            }
        })
        
    }

}
