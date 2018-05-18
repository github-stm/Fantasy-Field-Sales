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
    
    fileprivate static let colorLightGrey = UIColor(hexString: "EFEFF4")
    fileprivate static let colorMidGrey = UIColor(hexString: "D1D1D6")
    fileprivate static let colorGrey = UIColor(hexString: "C7C7CC")
    fileprivate static let colorDarkGrey = UIColor(hexString: "8E8E93")
    
    
    fileprivate static let colorGreen = UIColor(hexString: "09B182")
    fileprivate static let colorRed = UIColor(hexString: "CC0935")
    fileprivate static let colorBronze = UIColor(hexString: "CD7F32")
    
    
    

    // ------------------------------------------------------------------------------------------------------------
    struct LeagueTable {
        static let rowHeaderTitleBackground = colorBlack
        static let rowHeaderTitleText = colorWhite
        
        static let rowText = colorBlack
        static let rowBackgroundEven = colorLightGrey
        static let rowBackgroundOdd = colorWhite
        
        static let moreButtonBackground =  colorWhite
        static let moreButtonText =  colorBlack
        static let moreBorder = colorBlack
        
        static let selectedBackground = colorGold

    }

    struct TabButtons {
        static let selectedBackground = colorBlack
        static let unselectedBackground = colorWhite
        
        static let selectedText = colorWhite
        static let unselectedText = colorBlack
    }
    
    struct TableTitle {
        static let background = colorBlack
        static let text = colorWhite
        
        static let monthBackground = colorGold
        static let monthText = colorWhite
    }
   

}
