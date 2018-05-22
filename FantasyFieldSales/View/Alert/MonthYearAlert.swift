//
//  MonthYearAlert.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MonthYearAlert: UIView, Modal {
    
    var backgroundView = UIView()
    var dialogView = UIView()
    
     var pickerView: MonthYearPickerView?
   private var tableView: UITableView!
    
    var menuPos:MenuPosition?
    
    var startMonth: Int = 2017
    var startYear: Int = 1
    
    convenience init(startMonth:Int, startYear:Int) {
        self.init(frame: UIScreen.main.bounds)
        self.startMonth = startMonth
        self.startYear = startYear
        initialize()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialize(){

        let tableHeight: CGFloat =  100
        pickerView = MonthYearPickerView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: tableHeight),startMonth:self.startMonth , startYear:self.startYear)

        pickerView?.onDateSelected = { (date:Date) in
            let string = String(format: "%@", date as CVarArg)
            NSLog(string) // should show something like 05/2015
        }
        
        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        dialogView.addSubview(pickerView!)
        
        dialogView.frame.origin = CGPoint(x: 0, y: 100)
        dialogView.frame.size = CGSize(width: self.bounds.width, height: tableHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        print(dialogView.frame)
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: false)
    }

}


