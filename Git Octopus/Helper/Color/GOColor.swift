//
//  GOColor.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 05/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var appBlue: UIColor {
        guard let color = UIColor(named: "appBlue") else {return UIColor.white}
        return color
    }
    
    static var appLightBlue: UIColor {
        guard let color = UIColor(named: "appLightBlue") else {return UIColor.white}
        return color
    }
    
    static var appLightGray: UIColor {
        guard let color = UIColor(named: "appLightGray") else {return UIColor.white}
        return color
    }
}
