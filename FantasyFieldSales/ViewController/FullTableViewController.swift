//
//  FullTableViewController.swift
//  Diageo
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class FullTableViewController: UIViewController {

    var dataSource = FFSTableDataSource()
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension FullTableViewController: FFSTableDataSourceDelegate {
    
    func tableView(tableView: UITableView,  indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

