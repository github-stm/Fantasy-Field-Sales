//
//  ToggleButtons.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 10/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class ToggleButtons: NSObject {

   class func selectTabButton(buttons: [UIButton], index:Int) {
        for button: UIButton in buttons {
            
            if button.tag == index {
                button.setTitleColor(ColorManager.white, for: .normal)
                let backgroundImage = UIImage().imageWithColor(ColorManager.midBlue)
                button.setBackgroundImage(backgroundImage, for: .normal)
            } else {
                button.setTitleColor(ColorManager.midBlue, for: .normal)
                let backgroundImage = UIImage().imageWithColor(ColorManager.white)
                button.setBackgroundImage(backgroundImage, for: .normal)
            }
            
        }
        
    }

}
