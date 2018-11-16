//
//  GOTableViewController.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 08/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCViewModel

class GOTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    var goViewModel: QCTableViewModel? {
        return nil
    }

}

extension GOTableViewController: QCTableViewModelDelegate {
    
    func viewModelDidLoad() {
        if let tableView = self.tableView {
            self.goViewModel?.registerCells(tableView: tableView)
        }
        
        self.tableView?.dataSource = self.goViewModel
        self.tableView?.delegate = self.goViewModel
        
        self.tableView?.reloadData()
        self.tableView?.refreshControl?.endRefreshing()
    }
    
    func deleteRows(indexPaths: [IndexPath]) {
        self.tableView?.deleteRows(at: indexPaths, with: .automatic)
    }
    
    var viewModel: QCViewModel? {
        get {
            return self.goViewModel
        }
        set(newValue) {}
    }
}
