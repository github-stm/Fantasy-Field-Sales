//
//  MonthYearPickerView.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

    
    
protocol MonthYearPickerViewDelegate {
    func selectedRow(row:Int, rowTitle:String)
}

class MonthYearPickerView: UIView {
 //   var backgroundView: UIView
    
   // var dialogView: UIView
    var delegatePickerView: MonthYearPickerViewDelegate?
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var okButton: UIButton?
    @IBOutlet weak var cancelButton: UIButton?
    @IBOutlet weak var pickerView: UIPickerView?
    


    var months: [String]!
    var years: [Int]!
    
    var startMonth:Int?
    var startYear:Int?
    
    var month = Calendar.current.component(.month, from: Date()) {
        didSet {
            pickerView?.selectRow(month-1, inComponent: 0, animated: false)
        }
    }
    
    var year = Calendar.current.component(.year, from: Date()) {
        didSet {
            pickerView?.selectRow(years.index(of: year)!, inComponent: 1, animated: true)
        }
    }
    
    var onDateSelected: ((_ month: Int, _ year: Int) -> Void)?

    
    convenience init(frame: CGRect, startMonth:Int, startYear:Int) {
        self.init(frame: frame)
        self.startMonth = startMonth
        self.startYear = startYear
        initalizeSubviews()
        self.commonSetup()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalizeSubviews()
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalizeSubviews()
        self.commonSetup()
    }
    
    
    
    func initalizeSubviews() {
        let subviewArray = Bundle.main.loadNibNamed("MonthYearPickerView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    
    func commonSetup() {

        // population years
        var years: [Int] = []
        if years.count == 0 {
            var year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
            for _ in 1...15 {
                years.append(year)
                year += 1
            }
        }
        self.years = years
        
        // population months with localized names
        var months: [String] = []
        var month = 0
        for _ in 1...12 {
            months.append(DateFormatter().monthSymbols[month].capitalized)
            month += 1
        }
        self.months = months
        
        self.pickerView?.dataSource = self
        self.pickerView?.delegate = self
        
        let currentMonth = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: NSDate() as Date)
        pickerView?.selectRow(currentMonth - 1, inComponent: 0, animated: false)
    }
    
   
    
}

 // Mark: UIPicker Delegate

extension  MonthYearPickerView:  UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let month = pickerView.selectedRow(inComponent: 0)+1
        let year = years[pickerView.selectedRow(inComponent: 1)]
        if let block = onDateSelected {
            block(month, year)
        }
        
        self.month = month
        self.year = year
    }}


 // Mark: UIPicker  Data Source

extension  MonthYearPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return "\(years[row])"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return months.count
        case 1:
            return years.count
        default:
            return 0
        }
    }
}


