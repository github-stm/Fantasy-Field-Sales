//
//  MonthYearPickerView.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MonthYearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var months: [String]!
    var years: [Int]!
    
    var startMonth: Int?
    var startYear: Int?

    
    convenience init(frame: CGRect, startMonth:Int, startYear:Int) {
        self.init(frame: UIScreen.main.bounds)
        self.startMonth = startMonth
        self.startYear = startYear
        
    }
    
    var month = Calendar.current.component(.month, from: Date()) {
        didSet {
            selectRow(month-1, inComponent: 0, animated: false)
        }
    }
    
    var year = Calendar.current.component(.year, from: Date()) {
        didSet {
            selectRow(years.index(of: year)!, inComponent: 1, animated: true)
        }
    }
    
    var onDateSelected: ((_ date: Date) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonSetup()
    }
    
  
    /*
    func pickerViewSetUp(){
        var years: [Int] = []
        
        if let startYear = startYear {
            if years.count == 0 {
               // var year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
                var year = startYear
                for _ in startYear...endYear {
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
            
            self.delegate = self
            self.dataSource = self
            
            let currentMonth = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: NSDate() as Date)
            self.selectRow(currentMonth - 1, inComponent: 0, animated: false)
        }
        
    }
 */
    func commonSetup() {
        // population years

        var months: [String] = []
        var month = 0

        if  let startDate = Calendar.current.date(from: DateComponents(year: startYear, month: startMonth, day: 15)) {
            let monthCount = startDate.monthBetweenDates( endDate: Date())
            for _ in 0...monthCount {
                let newDate = Calendar.current.date(byAdding: .month, value: month, to: startDate)
                months.append((newDate?.getDateName(format: "MMMM yyyy"))!)
                month += 1
            }
            
            self.months = months

        }

        self.delegate = self
        self.dataSource = self
        
        let currentMonth = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: NSDate() as Date)
        self.selectRow(currentMonth - 1, inComponent: 0, animated: false)
        
        
        
    }
    
    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return months[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return months.count

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let x  = self.pickerView(self, titleForRow: self.selectedRow(inComponent: 0), forComponent: 0)
        
        if let block = onDateSelected {
            block((x?.stringToDate(format: "MMMM yyyy"))!)
        }

    }
    
}

