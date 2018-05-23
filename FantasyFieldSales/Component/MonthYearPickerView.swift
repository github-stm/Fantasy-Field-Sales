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

class MonthYearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegatePickerView: MonthYearPickerViewDelegate?
    
    var period: [String]!
  //  var years: [Int]!
    
    var startMonth: Int?
    var startYear: Int?

    
    convenience init(frame: CGRect, startMonth:Int, startYear:Int) {
        self.init(frame: frame)
        self.startMonth = startMonth
        self.startYear = startYear
        self.commonSetup()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonSetup()
    }
    
    func commonSetup() {

        var monthYear: [String] = []
        var month = 0
     
        if let startYear = self.startYear, let startMonth = self.startMonth {
            if  let startDate = Calendar.current.date(from: DateComponents(year: startYear, month: startMonth, day: 15)) {
                let monthCount = startDate.monthBetweenDates( endDate: Date())
                for _ in 0...monthCount {
                    let newDate = Calendar.current.date(byAdding: .month, value: month, to: startDate)
                    monthYear.append((newDate?.getDateName(format: Constants.dateFormat.monthYear))!)
                    
                    month += 1
                }
                
                self.period = monthYear
                
            }
            
            self.delegate = self
            self.dataSource = self

            self.selectRow(self.period.count - 1, inComponent: 0, animated: false)
            
        }

    }
    
    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return period[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return period.count

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let selectedPeriod  = self.pickerView(self, titleForRow: self.selectedRow(inComponent: 0), forComponent: 0)

        if let delegate = self.delegatePickerView {
            delegate.selectedRow(row: row, rowTitle: selectedPeriod!)
        }

    }
    
}

