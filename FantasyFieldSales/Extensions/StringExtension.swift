//
//  StringExtension.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

extension String {

    func stringToDate(format:String) -> Date? {
        let df = DateFormatter()
        df.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        df.dateFormat = format
        df.date(from: self)
        
        return df.date(from: self)
    }

}
