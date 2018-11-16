//
//  GOAlertRoutingEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCNavigation

struct GOAlertRoutingEntry: QCRoutingEntry {

    let alertControllerStyle: UIAlertController.Style
    let title: String?
    let message: String?
    var alertActions: [UIAlertAction]
    
    let sourceView: UIView
    let sourceRect: CGRect
    
    // MARK: Initialization
    
    // Init for alert
    init(title: String?,
         message: String?,
         alertActions: [UIAlertAction]) {
        
        self.title = title
        self.message = message
        self.alertControllerStyle = .actionSheet
        self.alertActions = alertActions
        
        self.sourceView = UIView()
        self.sourceRect = .zero
    }
    
    // MARK: - YMMRoutingEntry
    
    var viewController: UIViewController? {
        let alertController = UIAlertController(title: self.title,
                                                message: self.message,
                                                preferredStyle: self.alertControllerStyle)
        for action in self.alertActions {
            alertController.addAction(action)
        }
        
        return alertController
    }
    
    var navigationStyle: QCNavigationStyle {
        return .modal
    }
}
