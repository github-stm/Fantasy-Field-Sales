//
//  TitleView.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 29/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class TitleView: UIView {

    @IBOutlet var labels: [UILabel]!

    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var leftView: UIView?
    @IBOutlet weak var centerView: UIView?
    @IBOutlet weak var rightView: UIView?
    
    @IBOutlet weak var leftLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var rightLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initalizeSubviews()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalizeSubviews() 
        commonInit()
    }
    
    
    //needed to set frame of xib  to correct size in swift 3
    override func layoutSubviews() {
        self.contentView?.frame = bounds
    }
    
    
    func initalizeSubviews() {
        let subviewArray = Bundle.main.loadNibNamed("TitleView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    
    
    func commonInit(){
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        self.backgroundColor = ColorManager.TableTitle.background

        for label: UILabel in labels {
            label.font = font
            label.textColor = ColorManager.LeagueTable.rowText
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.isUserInteractionEnabled = false
        }
        
        leftView?.isHidden = true
        rightView?.isHidden = true
        leftView?.backgroundColor = UIColor.red
        leftView?.isUserInteractionEnabled = false
        rightView?.backgroundColor = UIColor.blue
        rightView?.isUserInteractionEnabled = false
    }

}
