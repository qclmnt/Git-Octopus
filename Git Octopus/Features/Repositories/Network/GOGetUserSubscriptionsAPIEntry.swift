//
//  GOGetUserSubscriptionsAPIEntry.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 06/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNetwork

class GOGetUserSubscriptionsAPIEntry: QCAPIEntry {
    
    // MARK: - QCAPIEntry
    
    var path: String {
        return "user/subscriptions?\(GOAPIConstant.accessToken)=\(GOAppEnvironment.shared().session?.accessToken ?? "")"
    }
    
    var entryParameters: [AnyHashable : Any]? {
        return [GOAPIConstant.perPage: 100]
    }
    
    func parsing(responseObject: Any?) -> Any? {
        guard let responseArray = responseObject as? [[String: Any]] else {return nil}
        // Reverse manually because the GitHub Api doesn't give access to order for subscriptions
        return Array(GOParser.parse(array: responseArray, type: GORepository.self).reversed())
    }
}
