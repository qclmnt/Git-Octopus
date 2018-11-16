//
//  QCTableViewModelDelegate.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 21/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCTableViewModelDelegate: QCViewModelDelegate {
    
    func refreshHeightCellsInTableView()
    func reloadVisibleCells()
    func reload(section: QCTableSection)
    func reloadDataView()
    func deleteRows(indexPaths: [IndexPath])
    func reloadRows(indexPaths: [IndexPath])
    func scrollToTop()
    
}

// Default implementation

public extension QCTableViewModelDelegate {
    
    func viewModelDidStartLoad() {}
    
    func viewModelDidFail(statusCode: Int) {}
    
    func refreshHeightCellsInTableView() {}
    
    func reloadVisibleCells() {}
    
    func reload(section: QCTableSection) {}
    
    func reloadDataView() {}
    
    func deleteRows(indexPaths: [IndexPath]) {}
    
    func reloadRows(indexPaths: [IndexPath]) {}
    
    func scrollToTop() {}
}
