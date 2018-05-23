//
//  TabDialog.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 23/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class TabDialog: UIView {

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var aButton: UIButton?
    @IBOutlet weak var bButton: UIButton?
    @IBOutlet weak var closeButton: UIButton?
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var infoLabel: UILabel?
    @IBOutlet weak var infoView: UIView?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    //needed to set frame of xib  to correct size in swift 3
    override func layoutSubviews() {
        self.contentView?.frame = bounds
    }
    
    
    func commonInit(){
        
        let subviewArray = Bundle.main.loadNibNamed("TabDialog", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
        
        contentView?.backgroundColor = UIColor.clear
        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        for button: UIButton in buttons {
            button.titleLabel?.font = smallFont
            button.titleLabel?.textColor = ColorManager.LeagueTable.rowHeaderTitleText
            button.titleLabel?.textAlignment = .center
        }
        
        aButton?.setTitle("Button A",for: .normal)
        let backgroundImage = UIImage().imageWithColor(ColorManager.LeagueTable.moreButtonText)
        aButton?.setBackgroundImage(backgroundImage, for: .normal)
        bButton?.setTitle("Button B",for: .normal)
        
    }

}
