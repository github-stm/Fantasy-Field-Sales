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
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var titleView: UIView?
    @IBOutlet weak var tabView: ScrollTabView?
    @IBOutlet weak var tableHeaderView: UIView?

    @IBOutlet weak var teamButton: UIButton?
    @IBOutlet weak var managerButton: UIButton?
    @IBOutlet weak var memberButton: UIButton?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var monthLabel: UILabel?
    
    @IBOutlet weak var positionHeaderLabel: UILabel?
    @IBOutlet weak var teamHeaderLabel: UILabel?
    @IBOutlet weak var pointsHeaderLabel: UILabel?
    
    var tabArray:[String]? = []
    

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
        
        tabView?.delegate = self

        let smallFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)

        let date = Date()
        monthLabel?.text = date.getMonthName()
        monthLabel?.font = smallFont
        monthLabel?.textColor = ColorManager.TableTitle.monthText
        monthLabel?.textAlignment = .center
        monthLabel?.backgroundColor = ColorManager.TableTitle.monthBackground
        
        titleLabel?.text = "LATEST TOP STATS"
        titleLabel?.font = smallFont
        titleLabel?.textColor = ColorManager.TableTitle.text
        titleLabel?.textAlignment = .center
        titleLabel?.backgroundColor = UIColor.clear
        
        titleView?.backgroundColor = ColorManager.TableTitle.background
        
        
        positionHeaderLabel?.text = "POS"
        teamHeaderLabel?.text = "TEAM"
        pointsHeaderLabel?.text = "PTS"
        
        for label: UILabel in labels {
            label.font = smallFont
            label.textColor = ColorManager.LeagueTable.rowHeaderTitleText
            label.textAlignment = .center
        }
        
        tableHeaderView?.backgroundColor = ColorManager.LeagueTable.rowHeaderTitleBackground
       

    }
    
    func reloadData(data:[String]){
        tabView?.collectionArray = data
        tabView?.collectionView?.reloadData()
        
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        tabView?.collectionView?.selectItem(at:indexPath, animated: false, scrollPosition: .left)
    }

}



extension LeagueTableHeaderView :ScrollTabViewDelegate {
    func selectedItem(indexPath: IndexPath) {
        
        if let delegate = self.delegate {
            delegate.selectedItem(indexPath: indexPath)
            print("header view indexpath row\(indexPath.row)")
            
        }
        
        print("2 header view indexpath row\(indexPath.row)")
    }
}


