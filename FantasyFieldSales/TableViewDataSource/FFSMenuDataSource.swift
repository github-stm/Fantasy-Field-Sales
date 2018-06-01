//
//  FFSMenuDataSource.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 18/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit





@objc protocol FFSMenuDataSourceDelegate: class {
    func selecteditem(tableView: UITableView,  indexPath: IndexPath)
}




class FFSMenuDataSource: NSObject {
    
    var delegate: FFSMenuDataSourceDelegate?
    
    fileprivate let cellIdentifier = "MenuCell"
    
    var array = Constants.teamGroup

    var footerType:FooterType = .NoFooter
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    init(footerType: FooterType) {
        self.footerType = footerType
        super.init()
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    convenience override init() {
        self.init(footerType:.NoFooter) // calls above default value
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func registerCells(forTableView tableView: UITableView) {
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {
        
        registerCells(forTableView: tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuCell
        
        self.configureCell(cell, indexPath:indexPath)
        return cell
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func configureCell(_ cell:MenuCell,  indexPath: IndexPath)
    {
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? ColorManager.LeagueTable.rowBackgroundEven : ColorManager.LeagueTable.rowBackgroundOdd
        let team = array[indexPath.row]
        cell.titleLabel?.text = String(team)

    }
    
}




// ------------------------------------------------------------------------------------------------------------

extension FFSMenuDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return array.count
       
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.menu.cellHeight
    }
    
}


// UITableViewDelegate
extension FFSMenuDataSource: UITableViewDelegate {
    


    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        if let delegate = self.delegate {
            delegate.selecteditem(tableView: tableView, indexPath: indexPath)
        }
    }
    
}




