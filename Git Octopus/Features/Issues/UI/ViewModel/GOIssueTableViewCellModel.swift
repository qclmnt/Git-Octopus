//
//  GOIssueTableViewCellModel.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

class GOIssueTableViewCellModel: QCTableCellViewModel {
    
    // MARK: - Properties
    
    let issue: GOIssue
    
    // MARK: - Initializa
    
    init(issue: GOIssue) {
        self.issue = issue
        super.init()
    }

    // MARK: - QCCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: GOIssueTableViewCell.self)
    }
    
    override func cellHeight(_ maxSize: CGSize) -> CGFloat {
        return 65
    }
    
    override func configureCell(_ cell: UITableViewCell) {
        guard let issueCell = cell as? GOIssueTableViewCell else {return}
        
        issueCell.titleLabel?.text = self.issue.title
        issueCell.commentsCountLabel?.text = "\(self.issue.commentsCount ?? 0)"
        // In order to get a readable date information use DateFormatter
        issueCell.updateLabel?.text = "\(NSLocalizedString("last.update", comment: "")) \(self.issue.updateAt ?? "")"
        
        if let imageStatusName = self.issue.state {
            issueCell.statusImageView?.image = UIImage(named: imageStatusName)
        }
    }
}
