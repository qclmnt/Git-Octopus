//
//  GOAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

// Default implementation of ApiEntry

extension QCAPIEntry {
    
    var basePath: String {
        return "https://api.github.com"
    }
    
    var method: QCAPIMethod {
        return .get
    }
    
    var finalParameters: [AnyHashable : Any]? {
        return self.entryParameters
    }
    
    func errorMessage(statusCode: Int) -> String {
        return "Error"
    }
    
    func parsing(responseObject: Any?) -> Any? {
        // Implement in ApiEntry if needed
        return nil
    }

}
