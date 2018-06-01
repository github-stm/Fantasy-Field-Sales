//
//  ContentViewController.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    
    var bckgrdColor:UIColor?
    var itemIndex:Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let backgroundColor = bckgrdColor {
          //  self.view.backgroundColor = backgroundColor
            
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "image")!)
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
