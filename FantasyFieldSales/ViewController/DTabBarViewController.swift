//
//  DTabBarViewController.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class DTabBarViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak fileprivate var contentView: UIView!
    
    @IBOutlet weak var container: UIView!
    
    var homeViewController: UIViewController!
    var teamViewController: UIViewController!
    var statsViewController: UIViewController!
    var moreViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        teamViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        viewControllers = [homeViewController, teamViewController]
        
        buttons[selectedIndex].isSelected = true
        tabButtonTapped(buttons[selectedIndex])
        
        configureAppearance()
        
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func configureAppearance() {
        
        
        for button: UIButton in buttons {
            
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont(name: Constants.font.boldFont, size: 16)
            
            var backgroundImage = UIImage().imageWithColor(ColorManager.darkBlue)
            button.setBackgroundImage(backgroundImage, for: .normal)
            backgroundImage = UIImage().imageWithColor(ColorManager.midBlue)
            button.setBackgroundImage(backgroundImage, for: .selected)
            
        }
        
        homeButton.setTitle("Home",for: .normal)
        teamButton.setTitle("Team",for: .normal)
        statsButton.setTitle("Stats",for: .normal)
        moreButton.setTitle("More",for: .normal)
        
        
    }
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        container.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    @IBAction func tabButtonTapped(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = (sender as AnyObject).tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
        
    }
    

}
