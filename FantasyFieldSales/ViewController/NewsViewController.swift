//
//  NewsViewController.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 10/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var headerImageView: UIImageView?
    @IBOutlet weak var headerView: UIView?
    @IBOutlet weak var headerLabel: UILabel?
    @IBOutlet weak var bodyView: UIView?
    @IBOutlet weak var bodyLabel: UILabel?
    
    var newsImageName = ""
    
    // ------------------------------------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let headerFont = UIFont(name: Constants.font.boldFont, size:  Constants.fontSize.mediumFontSize)
        let bodyFont = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        headerView?.backgroundColor = ColorManager.News.headerBackground
        bodyView?.backgroundColor = ColorManager.News.bodyBackground
        
        if let backgroundImage = UIImage(named: newsImageName) {
            headerImageView?.image =  backgroundImage
        }
     
        
        
        headerLabel?.font = headerFont
        headerLabel?.textColor = ColorManager.News.headerText
        headerLabel?.textAlignment = .left
        headerLabel?.text = Constants.text.newsHeader
        headerLabel?.numberOfLines = 0
        headerLabel?.lineBreakMode = .byWordWrapping
        
      

        bodyView?.backgroundColor = ColorManager.white
        bodyLabel?.font = bodyFont
        bodyLabel?.textColor = ColorManager.News.bodyText
        bodyLabel?.textAlignment = .left
        bodyLabel?.text = Constants.text.newsBody
        bodyLabel?.numberOfLines = 0
        bodyLabel?.lineBreakMode = .byWordWrapping


    }

    // ------------------------------------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
