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
    fileprivate static let colorLightGrey = UIColor(hexString: "D3D5D4")
    
    
    // ------------------------------------------------------------------------------------------------------------
    struct LeagueTable {
//        static let titleBackground = colorGold
//        static let titleText = colorBlack
        
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
   
    static let darkBlue = UIColor(hexString: "00275e")
    static let midBlue = UIColor(hexString: "0c479b")
    static let lightBlue = UIColor(hexString: "64ABE9")
    static let midGrey = UIColor(hexString: "999999")
    static let lightGrey = UIColor(hexString: "cccccc")
    static let betSlipb78080 = UIColor(hexString: "b78080")
}
