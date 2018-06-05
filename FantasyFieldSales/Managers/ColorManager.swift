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
    
    
    struct NavBar {
        static let background = colorBlack
        static let text = colorWhite
        

    }
    
    
    struct TabBar {
        static let background = colorBlack
        static let tint = colorWhite
        
        
    }
    
    struct Calendar  {
        static let buttonView = colorGold
        static let background = colorWhite
        static let text = colorGold
    }
    
    struct CallToActionButton {
       // static let borderWidth:CGFloat = 2
       
        static let border = colorWhite
        static let backgroundNormal = UIColor.clear
        static let textNormal = colorWhite
        static let backgroundHighlight = colorWhite
        static let textHighlight = colorGold
    }

    // ------------------------------------------------------------------------------------------------------------
    struct LeagueTable {
        static let rowHeaderTitleBackground = colorBlack
        static let rowHeaderTitleText = colorWhite
        
        static let rowText = colorDarkGrey
        static let rowBackgroundEven = colorLightGrey
        static let rowBackgroundOdd = colorWhite
        
        static let rowSelectedBackground = colorGold
        static let rowSelectedText = colorWhite
        
        
        static let moreButtonBackground =  colorWhite
        static let moreButtonText =  colorBlack
        static let moreBorder = colorBlack
       

    }

    struct Chart {
        static let background = colorGrey
        static let fill = colorGold
        static let text = colorBlack
        static let line = colorBlack
        
        static let avgFill = colorBlack
        static let avgText = colorWhite
        static let avgLine = colorGold
        
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
    
    struct TabDialog {
        
        static let background = colorMidGrey
        static let infoBackground = colorWhite
        
        static let tabSelectedBackground = colorGold
        static let tabUnselectedBackground = colorWhite
        
        static let tabSelectedText = colorWhite
        static let tabUnselectedText = colorGold
        
        static let titleText = colorGold
        static let infoText = colorGold
    }
   
    
    struct MonthYear {
        
        static let background = colorGold
        static let text = colorWhite
        
        
    }

}
