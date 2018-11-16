//
//  GOLanguageColor.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

struct GOLanguageColor {
    
    static let colors: [String: UIColor] = [
        "Objective-C": UIColor.appBlue,
        "Swift": UIColor.appLightBlue,
        "Java": UIColor.orange,
        "JavaScript": UIColor.orange,
        "HTML": UIColor.green,
        "Ruby": UIColor.purple
    ]
    
    static func getColor(for language: String?) -> UIColor {
        
        guard let lang = language,
            let color = colors[lang] else {return .gray}
        
        return color
    }

}
