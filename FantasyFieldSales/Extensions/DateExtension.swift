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
        dateFormatter.dateFormat = "MMM"
        let strMonth = dateFormatter.string(from: self).uppercased()
        return strMonth
    }
    
    
}

