//
//  FFSTableDataSource.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 14/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit
import RealmSwift


class FFSTableDataSource: NSObject {
    let leagueTableCellIdentifier = "LeagueTableCell"
    
    fileprivate let realm = try! Realm()
    lazy var teamData: Results<TeamData> = { self.realm.objects(TeamData.self) }()
    

    var delegate: FFSTableDataSourceDelegate?
    fileprivate var footerType:FooterType = .NoFooter
    
    var selectedIndexPath:IndexPath?

    var numberRows = 0
    // ------------------------------------------------------------------------------------------------------------
    
    init(footerType: FooterType) {
        self.footerType = footerType
        
        super.init()
        self.populateDefaultCategories()
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    convenience override init() {
        self.init(footerType:.NoFooter) // calls above default value
        populateDefaultCategories()
    }

    // ------------------------------------------------------------------------------------------------------------
    
    func populateDefaultCategories() {
        
        if teamData.count == 0 { // 1
            
            try! realm.write() { // 2

                let defaultTeamData = Constants.teams
                
                for teamData in defaultTeamData { // 4
                    let newTeamData = TeamData()
                    newTeamData.name = teamData.team
                    newTeamData.id = teamData.pos
                    newTeamData.points = teamData.points
                    newTeamData.position = teamData.pos
                    newTeamData.image = teamData.image
                    self.realm.add(newTeamData)
                  
                }
            }
            
            teamData = realm.objects(TeamData.self) // 5
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func registerCells(forTableView tableView: UITableView) {

        tableView.register(UINib(nibName: leagueTableCellIdentifier, bundle: nil), forCellReuseIdentifier: "LeagueTableCell")
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {

        registerCells(forTableView: tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: leagueTableCellIdentifier, for: indexPath) as! LeagueTableCell

        self.configureCell(cell, indexPath:indexPath)
        return cell
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func configureCell(_ cell:LeagueTableCell,  indexPath: IndexPath)
    {

        cell.backgroundColor = indexPath.row % 2 == 0 ? ColorManager.LeagueTable.rowBackgroundEven : ColorManager.LeagueTable.rowBackgroundOdd
        
        let team = teamData[indexPath.row]

        if team.position < 4 {
            var imageName = ""
            switch team.position {
            case 1:
                imageName = "first"
            case 2:
                imageName = "second"
            default:
                imageName = "third"
            }
            
            if let image = UIImage(named: imageName) {
                cell.positionImageView?.image = image
            }
            cell.positionLabel?.isHidden = true
            cell.positionImageView?.isHidden = false
        } else {
            cell.positionLabel?.isHidden = false
            cell.positionImageView?.isHidden = true
            cell.positionLabel?.text = String(team.position)
        }

        cell.mainTitleLabel?.text = team.name
        cell.subtitleLabel?.text = team.name
        cell.pointsLabel?.text = String(team.points)

        
        if team.image.count > 0 {
            let spacing:CGFloat = 3
            cell.changeImageView?.image = UIImage(named: team.image)?.imageWithInsets(insets: UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing))
        
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func deselectSelectedRow(tableView:UITableView){
        if let selectedIndexPath = selectedIndexPath {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}

// ------------------------------------------------------------------------------------------------------------

extension FFSTableDataSource: LeagueTableMoreFooterViewDelegate {
    
    func moreButtonTapped() {
        
        if let delegate = self.delegate {
            delegate.moreButtonTapped!()
        }
        
    }
}

// ------------------------------------------------------------------------------------------------------------

extension FFSTableDataSource: LeagueTableHeaderViewDelegate {
    func selectedItem(indexPath: IndexPath){
          print("FFSTableDataSource indexpath row\(indexPath.row)")
    }

}

// ------------------------------------------------------------------------------------------------------------

extension FFSTableDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if footerType == .NoFooter {
            return teamData.count
        } else {
            tableView.allowsSelection = false
            return 3
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.leagueTable.rowHeight
    }
  
}

// UITableViewDelegate
extension FFSTableDataSource: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = LeagueTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        return headerView
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.leagueTable.headerHeight
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        if let delegate = self.delegate {
            
            delegate.selectedItem(tableView: tableView, indexPath: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if footerType == .NoFooter {
            return nil
        } else {
            let footerView = LeagueTableMoreFooterView()
            footerView.delegate = self
            return footerView
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if footerType == .NoFooter {
            return 0
        } else {
            return Constants.leagueTable.footerHeight
        }

    }
}



@objc protocol FFSTableDataSourceDelegate: class {
    func selectedItem(tableView: UITableView,  indexPath: IndexPath)
    @objc optional func moreButtonTapped()
}
