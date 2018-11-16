//
//  GORepositoryCellProtocol.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

protocol GORepositoryCellProtocol {
    
    var fullNameLabel: UILabel? { get }
    var descLabel: UILabel? { get }
    var languageLabel: UILabel? { get }
    var languageColorView: UIView? { get }
    
}
