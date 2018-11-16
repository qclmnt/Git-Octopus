//
//  GOSearchRepositoryResultTableViewCell.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GOSearchRepositoryResultTableViewCell: UITableViewCell, GORepositoryCellProtocol {
    
    @IBOutlet weak var fullNameLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    @IBOutlet weak var languageLabel: UILabel?
    @IBOutlet weak var languageColorView: UIView?
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var watchButton: UIButton!
    
    var viewModel: GOSearchRepositoryResultTableViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.watchButton.layer.cornerRadius = GOLayoutConstant.cornerRadius
        
        guard let colorView = self.languageColorView else {return}
        colorView.layer.cornerRadius = colorView.frame.height/2
    }
    
    @IBAction func watchButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.updateWatchStateOfTheRepo(button: sender)
    }
}
