//
//  LeagueTableHeaderView.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


protocol LeagueTableHeaderViewDelegate {
    func selectedItem(indexPath: IndexPath)
}




class LeagueTableHeaderView: UIView {
    
    
    var delegate: LeagueTableHeaderViewDelegate?
    
    @IBOutlet weak fileprivate var contentView: UIView?

    @IBOutlet var labels: [UILabel]!
  //  @IBOutlet var buttons: [UIButton]!
    
//    @IBOutlet weak var titleView: UIView?
//    @IBOutlet weak var tabView: ScrollTabView?
    @IBOutlet weak var tableHeaderView: UIView?

//    @IBOutlet weak var teamButton: UIButton?
//    @IBOutlet weak var managerButton: UIButton?
//    @IBOutlet weak var memberButton: UIButton?
//
//    @IBOutlet weak var titleLabel: UILabel?
//    @IBOutlet weak var monthLabel: UILabel?
    
    @IBOutlet weak var positionHeaderLabel: UILabel?
    @IBOutlet weak var teamHeaderLabel: UILabel?
    @IBOutlet weak var pointsHeaderLabel: UILabel?
    
    var tabArray:[String]? = []
    

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
        let subviewArray = Bundle.main.loadNibNamed("LeagueTableHeaderView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    func commonInit(){

        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)

        positionHeaderLabel?.text = "POS"
        teamHeaderLabel?.text = "TEAM"
        pointsHeaderLabel?.text = "PTS"
        
        for label: UILabel in labels {
            label.font = font
            label.textColor = ColorManager.LeagueTable.rowHeaderTitleText
            label.textAlignment = .center
        }
        
        tableHeaderView?.backgroundColor = ColorManager.LeagueTable.rowHeaderTitleBackground

    }


}


