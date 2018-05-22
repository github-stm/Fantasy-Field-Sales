//
//  TestViewController.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let formatter = DateFormatter()
    
    var pickerView: MonthYearPickerView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         var date = "2001-05"
       
        print("dates \(stringToDate(date)!)")

    }

    
    
   
    
    func stringToDate(_ date: String) -> Date? {
        let df = DateFormatter()
        df.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        df.dateFormat = "yyyy-MM"
        df.date(from: date)
        
        return df.date(from: date)
    }
    
    
    
    
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.month], from: startDate, to: endDate)
        return components.month ?? 0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    


}



