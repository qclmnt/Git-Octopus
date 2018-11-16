//
//  QCAPIEntry.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCAPIEntry {

    var basePath: String { get }
    var path: String { get }
    var method: QCAPIMethod { get }
    var finalParameters: [AnyHashable: Any]? { get }
    var entryParameters: [AnyHashable: Any]? { get }
    
    func parsing(responseObject: Any?) -> Any?
    func errorMessage(statusCode: Int) -> String
}
