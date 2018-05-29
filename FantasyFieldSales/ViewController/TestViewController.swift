//
//  TestViewController.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


extension TestViewController: FFSDefaultDataSourceDelegate {
    
    func selectedItem(tableView: UITableView,  indexPath: IndexPath) {
        print("test")
    }
}


class TestViewController: UIViewController {

    fileprivate var dataSource = FFSDefaultDataSource()
    @IBOutlet weak var tableView: UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
/*
        let alert = TabDialogAlert()
        alert.show(animated: true)
        */
        
        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



