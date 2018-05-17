//
//  MoreCell.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 16/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MoreCell: UICollectionViewCell {
    
    @IBOutlet var labels: [UILabel]!
    
    

    @IBOutlet weak var topView: UIView?
    @IBOutlet weak var bottomView: UIView?
    
    @IBOutlet weak var topLabel: UILabel?
    @IBOutlet weak var bottomLabel: UILabel?
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? ColorManager.TabButtons.selectedBackground : ColorManager.TabButtons.unselectedBackground
//            self.titleLabel?.textColor = isSelected ? ColorManager.TabButtons.selectedText : ColorManager.TabButtons.unselectedText
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        for label: UILabel in labels {
            label.font = smallFont
            label.textColor = ColorManager.LeagueTable.rowText
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.isUserInteractionEnabled = false
        }
        
        topView?.backgroundColor = UIColor.red
        topView?.isUserInteractionEnabled = false
        bottomView?.backgroundColor = UIColor.blue
        bottomView?.isUserInteractionEnabled = false

        
    }

}
