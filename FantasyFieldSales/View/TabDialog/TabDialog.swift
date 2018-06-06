//
//  TabDialog.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 23/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

protocol TabDialogDelegate {
    func closeButtonTapped()
}

class TabDialog: UIView {

    var delegate: TabDialogDelegate?
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var aButton: UIButton?
    @IBOutlet weak var bButton: UIButton?
    @IBOutlet weak var closeButton: UIButton?
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var infoLabel: UILabel?
    @IBOutlet weak var infoView: UIView?

    @IBAction func buttonTapped(_ sender: UIButton) {
       buttonSelected(index: sender.tag)
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.closeButtonTapped()
        }
    }

    
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
        let subviewArray = Bundle.main.loadNibNamed("TabDialog", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
        self.layoutIfNeeded()
    }
    
    func commonInit(){

        contentView?.backgroundColor =  ColorManager.TabDialog.background
        
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        let boldFont = UIFont(name: Constants.font.boldFont, size:  Constants.fontSize.smallFontSize)
        
        
        for button: UIButton in buttons {
            button.titleLabel?.font = font
            button.titleLabel?.textColor = ColorManager.LeagueTable.rowHeaderTitleText
            button.titleLabel?.textAlignment = .center
        }
        
        aButton?.setTitle("Button A",for: .normal)
        bButton?.setTitle("Button B",for: .normal)
        
        buttonSelected(index: 0)

        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.text = Constants.text.newsHeader
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        titleLabel?.font = boldFont
        titleLabel?.textColor =  ColorManager.TabDialog.titleText
        titleLabel?.sizeToFit()
        
        infoLabel?.translatesAutoresizingMaskIntoConstraints = false
        infoLabel?.text = Constants.text.newsBody
        infoLabel?.lineBreakMode = .byWordWrapping
        infoLabel?.numberOfLines = 0
        infoLabel?.font = font
        infoLabel?.textColor = ColorManager.TabDialog.infoText
        infoLabel?.sizeToFit()

    }
    
    
    func buttonSelected(index:Int) {
        
        ToggleButtons.selectTabButton(buttons: buttons, index: index, selectBackgroundColor: ColorManager.TabDialog.tabSelectedBackground, unselectBackgroundColor: ColorManager.TabDialog.tabUnselectedBackground, selectedTextColor: ColorManager.TabDialog.tabSelectedText, unselectedTextColor: ColorManager.TabDialog.tabUnselectedText)
    }
    

}
