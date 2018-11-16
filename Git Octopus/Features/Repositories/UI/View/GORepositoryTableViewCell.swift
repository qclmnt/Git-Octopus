//
//  GORepositoryTableViewCell.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GORepositoryTableViewCell: UITableViewCell, GORepositoryCellProtocol {
    
    // MARK: - Properties
    
    @IBOutlet weak var fullNameLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    @IBOutlet weak var languageLabel: UILabel?
    @IBOutlet weak var languageColorView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let colorView = self.languageColorView else {return}
        colorView.layer.cornerRadius = colorView.frame.height/2
    }
    
}
