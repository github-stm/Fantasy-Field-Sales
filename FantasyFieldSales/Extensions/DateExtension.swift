//
//  DateExtension.swift
//  Diageo
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

extension Date {
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let strMonth = dateFormatter.string(from: self).uppercased()
        return strMonth
    }
    
    func getDateName(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let strMonth = dateFormatter.string(from: self).uppercased()
        return strMonth
    }
    
    
    func monthBetweenDates(endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.month], from: self, to: endDate)
        return components.month!
    }
    
    
   
    
    
    
    
}

