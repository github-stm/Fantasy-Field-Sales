//
//  ToggleButtons.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 10/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class ToggleButtons: NSObject {

    class func selectTabButton(buttons: [UIButton], index:Int, selectBackgroundColor: UIColor, unselectBackgroundColor: UIColor, textColor: UIColor) {
        for button: UIButton in buttons {
            
            if button.tag == index {
                button.setTitleColor(ColorManager.TabButtons.selectedText, for: .normal)
                let backgroundImage = UIImage().imageWithColor(selectBackgroundColor)
                button.setBackgroundImage(backgroundImage, for: .normal)
            } else {
                button.setTitleColor(ColorManager.TabButtons.unselectedText, for: .normal)
                let backgroundImage = UIImage().imageWithColor(unselectBackgroundColor)
                button.setBackgroundImage(backgroundImage, for: .normal)
            }
            
        }
        
    }

}
