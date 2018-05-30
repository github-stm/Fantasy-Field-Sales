//
//  TitleView.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 29/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class TitleView: UIView {

 //   var delegate: ScrollTabViewDelegate?
    
    
  //  @IBOutlet var buttons: [UIButton]!
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
        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
//        titleLabel?.font = smallFont
//        titleLabel?.textColor = ColorManager.TableTitle.text
//        titleLabel?.textAlignment = .center
//        titleLabel?.backgroundColor = UIColor.clear
        
        self.backgroundColor = ColorManager.TableTitle.background
        
        
        for label: UILabel in labels {
            label.font = smallFont
            label.textColor = ColorManager.LeagueTable.rowText
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.isUserInteractionEnabled = false
        }
        
        leftView?.backgroundColor = UIColor.red
        leftView?.isUserInteractionEnabled = false
        rightView?.backgroundColor = UIColor.blue
        rightView?.isUserInteractionEnabled = false
    }

}
