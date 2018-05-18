//
//  FFSTableDataSource.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 14/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit



class FFSTableDataSource: NSObject {
    let leagueTableCellIdentifier = "LeagueTableCell"
    

    var array = Constants.teams
    var delegate: FFSTableDataSourceDelegate?
    var footerType:FooterType = .NoFooter
    
    
    init(footerType: FooterType) {
        self.footerType = footerType
        super.init()
    }
    
    convenience override init() {
        self.init(footerType:.NoFooter) // calls above default value
    }

    func registerCells(forTableView tableView: UITableView) {

        tableView.register(UINib(nibName: leagueTableCellIdentifier, bundle: nil), forCellReuseIdentifier: "LeagueTableCell")
    }
    
    func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {

        registerCells(forTableView: tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: leagueTableCellIdentifier, for: indexPath) as! LeagueTableCell
        
        self.configureCell(cell, indexPath:indexPath)
        return cell
    }
    
    func configureCell(_ cell:LeagueTableCell,  indexPath: IndexPath)
    {

        cell.backgroundColor = indexPath.row % 2 == 0 ? ColorManager.LeagueTable.rowBackgroundEven : ColorManager.LeagueTable.rowBackgroundOdd
        let team = array[indexPath.row]
        cell.positionLabel?.text = String(team.pos)
        cell.teamLabel?.text = team.team
        cell.pointsLabel?.text = String(team.points)
    }
    
}


extension FFSTableDataSource: LeagueTableMoreFooterViewDelegate {
    
    func moreButtonTapped() {
        
        if let delegate = self.delegate {
            delegate.moreButtonTapped!()
        }
        
    }
}

extension FFSTableDataSource: LeagueTableHeaderViewDelegate {
    func selectedItem(indexPath: IndexPath){
          print("FFSTableDataSource indexpath row\(indexPath.row)")
    }

}

extension FFSTableDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if footerType == .NoFooter {
            return array.count
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}
// UITableViewDelegate
extension FFSTableDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = LeagueTableHeaderView()
        
        headerView.delegate = self
      //  headerView.tabArray = Constants.teamGroup
        
        headerView.reloadData(data: Constants.teamGroup)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        if let delegate = self.delegate {
            delegate.tableView(tableView: tableView, indexPath: indexPath)
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if footerType == .NoFooter {
            return nil
        } else {
            let footerView = LeagueTableMoreFooterView()
            footerView.delegate = self
            return footerView
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if footerType == .NoFooter {
            return 0
        } else {
            return 75
        }
        
   
    }
}



@objc protocol FFSTableDataSourceDelegate: class {
    func tableView(tableView: UITableView,  indexPath: IndexPath)
    @objc optional func moreButtonTapped()
}
