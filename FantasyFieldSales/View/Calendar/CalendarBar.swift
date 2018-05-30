//
//  CalendarBar.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit




class CalendarBar: UIView {

    
  //  var delegate: LeagueTableHeaderViewDelegate?
    
    @IBOutlet weak fileprivate var contentView: UIView?
    
    
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var dropdownImageView: UIImageView?

    
    var isDown = true
    
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
        let subviewArray = Bundle.main.loadNibNamed("CalendarBar", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let alert = MonthYearAlert(startMonth: 12, startYear: 2017)
        alert.show(animated: true)
        
    }
    

    
    func commonInit(){

        dropdownImageView?.contentMode = .center
        
        let spacing:CGFloat = 3
        dropdownImageView?.image = UIImage(named: "arrow")?.imageWithInsets(insets: UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing))

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

        self.contentView?.isUserInteractionEnabled = true
        self.contentView?.addGestureRecognizer(tap)
        dropdownImageView?.contentMode = .scaleAspectFill

        self.contentView?.backgroundColor = UIColor.black
        
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        let date = Date()
        dateLabel?.text = date.getMonthName()
        dateLabel?.font = font
        dateLabel?.textColor = ColorManager.TableTitle.monthText
        dateLabel?.textAlignment = .center
        dateLabel?.backgroundColor = ColorManager.TableTitle.monthBackground

    }
    
  

}



