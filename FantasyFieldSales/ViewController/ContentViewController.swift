//
//  ContentViewController.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    
    var backgroundImage = ""
    var itemIndex:Int = 0
    
    @IBOutlet weak var imageView: UIImageView?
    
    // ------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: backgroundImage) {
            imageView?.image =  backgroundImage
        }

    }

    // ------------------------------------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
