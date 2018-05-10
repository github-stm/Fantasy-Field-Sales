//
//  UIColorExtension.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    //Creates a color from a hex string
    convenience init(hexString: String) {
        // Trim leading '#' if needed
        var cleanedHexString:String = hexString
        if hexString.hasPrefix("#") {
            cleanedHexString = String(hexString.dropFirst())
        }
        
        let isAlpha: Bool = cleanedHexString.count > 6
        // String -> UInt32
        var rgbValue: UInt32 = 0
        Scanner(string: cleanedHexString).scanHexInt32(&rgbValue)
        
        // UInt32 -> R,G,B
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0
        
        if isAlpha{
            let alpha = CGFloat((rgbValue >> 24) & 0xff) / 255.0
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        else{
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        }
        
    }
    
    
}
