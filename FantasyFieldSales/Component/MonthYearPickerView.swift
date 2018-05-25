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

class MonthYearPickerView: UIPickerView {
    
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
                    if let date = newDate?.getDateName(format: Constants.dateFormat.monthYear) {
                        monthYear.append(date)
                        month += 1
                    }
                }
                self.period = monthYear
            }
            
            self.delegate = self
            self.dataSource = self
            
            if self.period.count > 0 {
                self.selectRow(self.period.count - 1, inComponent: 0, animated: false)
                self.backgroundColor = ColorManager.MonthYear.background
            }
        }
    }

}

 // Mark: UIPicker Delegate

extension  MonthYearPickerView:  UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedPeriod  = self.pickerView(self, attributedTitleForRow: self.selectedRow(inComponent: 0), forComponent: 0)
        
        if let delegate = self.delegatePickerView, let period = selectedPeriod
        {
            delegate.selectedRow(row: row, rowTitle: period.string)
        }
        
        
    }
}


 // Mark: UIPicker  Data Source

extension  MonthYearPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: period[row], attributes: [NSAttributedStringKey.foregroundColor : ColorManager.MonthYear.text])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return period.count
        
    }
}


