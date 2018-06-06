//
//  MenuAlert.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 18/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MenuAlert: UIView, Modal {

    var backgroundView = UIView()
    var dialogView = UIView()
    
    var dataSource = FFSMenuDataSource()
    
    var menuList = Constants.teamGroup
    private var tableView: UITableView!
    
    var menuPos:MenuPosition?

    convenience init(menuPosition: MenuPosition) {
        self.init(frame: UIScreen.main.bounds)
        self.menuPos = menuPosition
        initialize()

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialize(){
        
        
        guard let menuPos = self.menuPos  else {
            return
        }
        
        let tableHeight: CGFloat =  CGFloat(menuList.count) * Constants.menu.cellHeight
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Constants.menu.width, height: tableHeight))

        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource

        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        dialogView.addSubview(tableView)

        dialogView.frame.origin = CGPoint(x: getPositionX(menuPos: menuPos), y: 30)
        dialogView.frame.size = CGSize(width: Constants.menu.width, height: tableHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6

        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
    
    fileprivate func getPositionX(menuPos:MenuPosition) -> CGFloat {
        let padding:CGFloat = Constants.menu.alertPadding
        switch (menuPos) {
            case .Left:
                return  padding
            case .Center:
                return (UIScreen.main.bounds.size.width - Constants.menu.width)/2
            default:
                return UIScreen.main.bounds.size.width -  Constants.menu.width - padding
        }
    }

}


extension MenuAlert: FFSMenuDataSourceDelegate {
    
    func selecteditem(tableView: UITableView, indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}



