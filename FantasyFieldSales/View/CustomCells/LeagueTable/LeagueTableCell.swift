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
    @IBOutlet weak var mainTitleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var pointsLabel: UILabel?
    
    @IBOutlet weak var positionImageView: UIImageView?
    @IBOutlet weak var changeImageView: UIImageView?
    
    
    @IBOutlet weak var subBackgroundView: UIView?
    

    override func awakeFromNib() {
    
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorManager.LeagueTable.rowSelectedBackground
        self.selectedBackgroundView = backgroundView
        
        
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        let boldFont = UIFont(name: Constants.font.boldFont, size:  Constants.fontSize.smallFontSize)
        
        for label: UILabel in labels {
            label.font = font
            label.textColor = ColorManager.LeagueTable.rowText
            label.textAlignment = .center
            label.highlightedTextColor = ColorManager.LeagueTable.rowSelectedText
            
        }
        
        mainTitleLabel?.font = boldFont
        
        subBackgroundView?.backgroundColor = UIColor.clear
    }
    
    
   
}
