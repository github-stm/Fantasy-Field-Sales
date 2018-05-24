//
//  FFSDefaultDataSource.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 24/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit
import RealmSwift


@objc protocol FFSDefaultDataSourceDelegate: class {
    func selectedItem(tableView: UITableView,  indexPath: IndexPath)

}



class FFSDefaultDataSource: NSObject {
    fileprivate let cellIdentifier = "DefaultCell"

    var delegate: FFSDefaultDataSourceDelegate?
    var dataArray = Constants.distributionExecutive


    func registerCells(forTableView tableView: UITableView) {
        
        tableView.register(UINib(nibName: "DefaultCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {
        
        registerCells(forTableView: tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DefaultCell
        
        self.configureCell(cell, indexPath:indexPath)
        return cell
    }
    
    func configureCell(_ cell:DefaultCell,  indexPath: IndexPath)
    {
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? ColorManager.LeagueTable.rowBackgroundEven : ColorManager.LeagueTable.rowBackgroundOdd
        
        let data = dataArray[indexPath.row]

        cell.titleLabel?.text = data.name
        cell.subTitleLabel?.text = data.region

    }
    
}

extension FFSDefaultDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
}

// UITableViewDelegate
extension FFSDefaultDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        if let delegate = self.delegate {
            delegate.selectedItem(tableView: tableView, indexPath: indexPath)
        }
    }

}
