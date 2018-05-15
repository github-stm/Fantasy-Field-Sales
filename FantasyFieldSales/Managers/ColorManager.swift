//
//  ColorManager.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


class ColorManager: UIColor {
    
    fileprivate static let colorWhite = UIColor(hexString: "ffffff")
    fileprivate static let colorBlack = UIColor(hexString: "000000")
    fileprivate static let colorGold = UIColor(hexString: "BB9959")
    
    // ------------------------------------------------------------------------------------------------------------
    struct LeagueTable {
        static let titleBackground = colorGold
        static let titleText = colorBlack
        
        static let tabSelectedBackground = colorBlack
        static let tabSelectedText = colorWhite
        
        static let tabUnselectedBackground = colorWhite
        static let tabUnselectedText = colorBlack
        
        static let rowHeaderTitleBackground = colorBlack
        static let rowHeaderTitleText = colorWhite
        
        static let rowText = colorBlack
        static let rowBackgroundEven = colorGold
        static let rowBackgroundOdd = colorWhite
        
        static let moreButtonBackground =  colorBlack
        static let moreButtonText =  colorWhite
        
        
    }
    
    
    
    struct TabButtons {
        static let selectedBackground = colorBlack
        static let unselectedBackground = colorWhite
        
        static let selectedText = colorWhite
        static let unselectedText = colorBlack
        
    }
    
    
    static let darkBlue = UIColor(hexString: "00275e")
    static let midBlue = UIColor(hexString: "0c479b")
    static let lightBlue = UIColor(hexString: "64ABE9")
    static let midGrey = UIColor(hexString: "999999")
    static let lightGrey = UIColor(hexString: "cccccc")
    static let betSlipb78080 = UIColor(hexString: "b78080")
}
