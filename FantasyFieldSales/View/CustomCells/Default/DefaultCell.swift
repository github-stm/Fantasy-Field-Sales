//
//  DefaultCell.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 24/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class DefaultCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subTitleLabel: UILabel?
    @IBOutlet weak var disclosureImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        let boldFont = UIFont(name: Constants.font.boldFont, size:  Constants.fontSize.smallFontSize)
        
        titleLabel?.font = boldFont
        titleLabel?.textColor = ColorManager.LeagueTable.rowText
        titleLabel?.textAlignment = .left
        titleLabel?.backgroundColor = UIColor.clear
        
        subTitleLabel?.font = smallFont
        subTitleLabel?.textColor = ColorManager.LeagueTable.rowText
        subTitleLabel?.textAlignment = .left
        subTitleLabel?.backgroundColor = UIColor.clear

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
