//
//  MonthYearAlert.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

extension MonthYearAlert: MonthYearPickerViewDelegate {
    func selectedRow(row:Int, rowTitle:String) {
        print("row \(row)  title \(rowTitle)")
        // rowTitle.stringToDate(format: Constants.dateFormat.monthYear))!)
    }
}

class MonthYearAlert: UIView, Modal {
    
    var backgroundView = UIView()
    var dialogView = UIView()
    var pickerView: MonthYearPickerView?
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

        let tableHeight: CGFloat =  216
        let padding:CGFloat = 50

        pickerView = MonthYearPickerView(frame: CGRect.zero, startMonth:self.startMonth , startYear:self.startYear)
        pickerView?.delegatePickerView = self

        dialogView.clipsToBounds = true

        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        dialogView.addSubview(pickerView!)
        dialogView.frame.origin = CGPoint(x: padding, y: 100)
        dialogView.frame.size = CGSize(width: self.bounds.width - (padding * 2), height: tableHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        print(dialogView.frame)
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: false)
    }

}


