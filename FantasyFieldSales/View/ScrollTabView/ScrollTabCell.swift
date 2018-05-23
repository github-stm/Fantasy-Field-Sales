//
//  ScrollTabCell.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 15/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class ScrollTabCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? ColorManager.TabButtons.selectedBackground : ColorManager.TabButtons.unselectedBackground
            self.titleLabel?.textColor = isSelected ? ColorManager.TabButtons.selectedText : ColorManager.TabButtons.unselectedText
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.textAlignment = .center
    }


}
