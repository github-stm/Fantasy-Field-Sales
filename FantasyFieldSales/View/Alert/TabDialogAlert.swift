//
//  TabDialogAlert.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 23/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class TabDialogAlert: UIView, Modal {

    var backgroundView = UIView()
    var dialogView = UIView()
    var tabDialog: TabDialog?

    // ------------------------------------------------------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        initialize()
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    func initialize(){

        let padding:CGFloat = 30
        let subViewPadding: CGFloat = 35
        let width = UIScreen.main.bounds.size.width - (padding * 2)
        
        self.layer.cornerRadius = 10.0

        //Need to set initial width so the calculation for dialog height is accurate
        tabDialog = TabDialog(frame:CGRect(x: 0, y: 0, width: width, height: 150))
        tabDialog?.delegate = self
        
        var height:CGFloat = 200
        if let tabDialog = tabDialog, let button = tabDialog.aButton,  let titleLabel = tabDialog.titleLabel, let infoLabel = tabDialog.infoLabel {
            
            height = (subViewPadding * 2) + button.frame.size.height + titleLabel.frame.size.height + infoLabel.frame.size.height + 24.0
            
            tabDialog.frame.size = CGSize(width: width, height: height)
            
        }


        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6

        backgroundView.addTapGestureRecognizer {
            self.dismiss(animated: true)
        }

        addSubview(backgroundView)
        
        dialogView.addSubview(tabDialog!)
        dialogView.frame.origin = CGPoint(x: padding, y: 100)
        dialogView.frame.size = CGSize(width: width , height: height)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        addSubview(dialogView)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }

}


extension TabDialogAlert: TabDialogDelegate {
    func closeButtonTapped() {
        dismiss(animated: true)
    }
}
