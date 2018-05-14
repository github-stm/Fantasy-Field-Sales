//
//  LeagueTableCell.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class LeagueTableCell: UITableViewCell {
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var positionLabel: UILabel?
    @IBOutlet weak var teamLabel: UILabel?
    @IBOutlet weak var pointsLabel: UILabel?
    
    override func awakeFromNib() {
    
        
        
//        let subviewArray = Bundle.main.loadNibNamed("LeagueTableCell", owner: self, options: nil)
//        self.addSubview(subviewArray!.first as! UIView)
        
        let largeFont = UIFont(name: Constants.font.regularFont, size: Constants.fontSize.largeFontSize)
        let font = UIFont(name: Constants.font.regularFont, size: Constants.fontSize.mediumFontSize)
        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
      //  let bgView: UIView = UIView()
        //self.backgroundColor = ColorManager.lightGrey

        
        let selectedBgView:UIView = UIView()
        selectedBgView.backgroundColor = UIColor.gray
        
      
        for label: UILabel in labels {
            label.font = smallFont
            label.textColor = ColorManager.darkBlue
            label.textAlignment = .center
            
            
        }
        
        
    }
    
    
    

}
