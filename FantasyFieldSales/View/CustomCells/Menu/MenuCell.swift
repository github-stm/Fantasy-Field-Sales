//
//  MenuCell.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 18/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subBackgroundView: UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
 
        titleLabel?.font = font
        titleLabel?.textColor = ColorManager.LeagueTable.rowText
        titleLabel?.textAlignment = .center

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
