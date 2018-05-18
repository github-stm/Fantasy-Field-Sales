//
//  MenuAlert.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 18/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


/*
 let alert = CustomAlert(title: "Hello there!! 👋🏻👋🏻", image: UIImage(named: "img")!)
 alert.show(animated: true)
 */


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
        
        
       // tableView = UITableView(frame: CGRect.zero)
        
        let rowHeight:CGFloat = 30
        
        let tableHeight: CGFloat =  CGFloat(menuList.count) * rowHeight
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
        
        
        let padding:CGFloat = 30
        var positionX:CGFloat = padding
        
        switch (menuPos) {
        case .Left?:
            positionX = padding
        case .Center?:
            positionX = (UIScreen.main.bounds.size.width - Constants.menu.width)/2
        default:
            positionX = UIScreen.main.bounds.size.width -  Constants.menu.width - padding
        }

        dialogView.frame.origin = CGPoint(x: positionX, y: 30)
        dialogView.frame.size = CGSize(width: Constants.menu.width, height: tableHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        print(dialogView.frame)
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }

}


extension MenuAlert: FFSMenuDataSourceDelegate {
    
    func selecteditem(tableView: UITableView, indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}



