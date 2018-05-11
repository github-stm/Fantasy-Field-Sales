//
//  UIViewExtension.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 11/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
