//
//  LeagueTableMoreFooterView.swift
//  Diageo
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


protocol LeagueTableMoreFooterViewDelegate {
    func moreButtonTapped()
}


class LeagueTableMoreFooterView: UIView {
    
    var delegate: LeagueTableMoreFooterViewDelegate?
    
    @IBOutlet weak fileprivate var contentView: UIView?
    @IBOutlet weak fileprivate var moreButton: UIButton?
    
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
        let subviewArray = Bundle.main.loadNibNamed("LeagueTableMoreFooterView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    
    
    func commonInit(){

        contentView?.backgroundColor = UIColor.clear
        
        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)

        moreButton?.setTitle("View full table",for: .normal)

        moreButton?.setTitleColor(ColorManager.LeagueTable.moreButtonText, for: .normal)
        moreButton?.titleLabel?.font = UIFont(name: Constants.font.regularFont, size: 18)
        moreButton?.layer.cornerRadius = 5
        moreButton?.layer.borderWidth = 1

        moreButton?.layer.borderColor = ColorManager.LeagueTable.moreBorder.cgColor
        var backgroundImage = UIImage().imageWithColor(ColorManager.LeagueTable.moreButtonBackground)
        moreButton?.setBackgroundImage(backgroundImage, for: .normal)
        backgroundImage = UIImage().imageWithColor(ColorManager.LeagueTable.moreButtonBackground)
        moreButton?.setBackgroundImage(backgroundImage, for: .selected)
        
    }

    //------------------------------------------------------------------------------------------------------------
    
    @IBAction func moreButtonTapped(_ sender: AnyObject)
    {
        if let delegate = self.delegate {
            delegate.moreButtonTapped()
            
        }
    }
}
