//
//  MainTabBar.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 31/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {
    var cleanDone = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.deleteUnusedViews()
    }

    func deleteUnusedViews() {
        if !self.cleanDone {
            var removeCount = 0
            for (_, eachView) in (self.subviews.enumerated()) {
               // print("eachview \(eachView)")
                if NSStringFromClass(eachView.classForCoder).range(of:"_UIBarBackground") != nil {
                    eachView.removeFromSuperview()
                    removeCount += 1
                }
                if NSStringFromClass(eachView.classForCoder).range(of:"UIImageView") != nil {
                    eachView.removeFromSuperview()
                    removeCount += 1
                }
                if removeCount == 2 {
                    self.cleanDone = true
                    break
                }
            }
        }
    }
}
