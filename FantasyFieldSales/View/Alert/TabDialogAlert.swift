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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        initialize()
    }
    
    
    func initialize(){
        
        let height: CGFloat =  300
        let padding:CGFloat = 30
        
       //  let width:CGFloat = 300
        
        let width = UIScreen.main.bounds.size.width - (padding * 2)
        tabDialog = TabDialog(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tabDialog?.frame.size = CGSize(width: width, height: height)
       // tabDialog?.delegatePickerView = self
        
        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        dialogView.addSubview(tabDialog!)
        dialogView.frame.origin = CGPoint(x: padding, y: 100)
        dialogView.frame.size = CGSize(width: width , height: height)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        print(dialogView.frame)
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }

}
