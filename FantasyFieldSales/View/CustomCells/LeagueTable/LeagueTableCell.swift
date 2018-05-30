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
    
    @IBOutlet weak var subBackgroundView: UIView?
    
    
    override var isHighlighted: Bool {
        didSet {
            self.subBackgroundView?.backgroundColor = isHighlighted ? ColorManager.LeagueTable.selectedBackground : UIColor.clear
        }
    }

    override func awakeFromNib() {
    
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        for label: UILabel in labels {
            label.font = font
            label.textColor = ColorManager.LeagueTable.rowText
            label.textAlignment = .center
        }
        
        subBackgroundView?.backgroundColor = UIColor.clear
    }

}
