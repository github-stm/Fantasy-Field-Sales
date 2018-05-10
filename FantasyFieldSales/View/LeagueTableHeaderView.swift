//
//  LeagueTableHeaderView.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class LeagueTableHeaderView: UIView {
    
    @IBOutlet weak fileprivate var contentView: UIView?

    @IBOutlet var labels: [UILabel]!
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBOutlet weak var titleView: UIView?
    @IBOutlet weak var tabView: UIView?
    @IBOutlet weak var tableHeaderView: UIView?

    @IBOutlet weak var teamButton: UIButton?
    @IBOutlet weak var managerButton: UIButton?
    @IBOutlet weak var memberButton: UIButton?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var monthLabel: UILabel?
    
    @IBOutlet weak var positionHeaderLabel: UILabel?
    @IBOutlet weak var teamHeaderLabel: UILabel?
    @IBOutlet weak var pointsHeaderLabel: UILabel?
    
    
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

        let subviewArray = Bundle.main.loadNibNamed("LeagueTableHeaderView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)

        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)

        positionHeaderLabel?.text = "POS"
        teamHeaderLabel?.text = "TEAM"
        pointsHeaderLabel?.text = "PTS"
        
        for label: UILabel in labels {
            label.font = smallFont
            label.textColor = ColorManager.darkBlue
            label.textAlignment = .center
        }
        
        monthLabel?.font = smallFont
        monthLabel?.textColor = UIColor.white
        monthLabel?.textAlignment = .center
        monthLabel?.backgroundColor = ColorManager.darkBlue
        
        let date = Date()
        monthLabel?.text = date.getMonthName()
        titleLabel?.text = "LATEST TOP STATS"
        titleLabel?.font = smallFont
        titleLabel?.textColor = ColorManager.darkBlue
        titleLabel?.textAlignment = .center
        titleLabel?.backgroundColor = UIColor.clear
        
        titleView?.backgroundColor = ColorManager.midBlue
        
        teamButton?.setTitle("Team",for: .normal)
        managerButton?.setTitle("Manager",for: .normal)
        memberButton?.setTitle("Team Member",for: .normal)
        
        for button: UIButton in buttons {
            
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont(name: Constants.font.regularFont, size: 16)
            
            var backgroundImage = UIImage().imageWithColor(ColorManager.darkBlue)
            button.setBackgroundImage(backgroundImage, for: .normal)
            backgroundImage = UIImage().imageWithColor(ColorManager.midBlue)
            button.setBackgroundImage(backgroundImage, for: .selected)
            
        }
        
    }
}
