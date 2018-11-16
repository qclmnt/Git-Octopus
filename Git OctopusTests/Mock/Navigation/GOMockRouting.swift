//
//  GOMockRouting.swift
//  Git OctopusTests
//
//  Created by Quentin CLEMENT on 07/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

@testable import QCNavigation

class GOMockRouting: QCNavigator {
    
    var lastRoutingEntry: QCRoutingEntry?
    
    func visibleViewController() -> UIViewController? {
        return self.visibleViewController(nil)
    }
    
    func visibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        return UIViewController()
    }
    
    func route(to entry: QCRoutingEntry) {
        self.route(to: entry, from: nil)
    }
    
    func route(to entry: QCRoutingEntry, from fromViewController: UIViewController?) {
        self.lastRoutingEntry = entry
    }
    

    
}
