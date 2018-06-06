//
//  MoreCell.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 16/05/2018.
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

        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        for label: UILabel in labels {
            label.font = font
            label.textColor = ColorManager.More.bottomText
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.isUserInteractionEnabled = false
        }
        
        topView?.backgroundColor = ColorManager.More.topBackground
        topView?.isUserInteractionEnabled = false
        bottomView?.backgroundColor = ColorManager.More.bottomBackground
        bottomView?.isUserInteractionEnabled = false
        
        self.layer.borderWidth = 2
        self.layer.borderColor =  UIColor.black.cgColor
        self.layer.cornerRadius = 5

        
    }

}
