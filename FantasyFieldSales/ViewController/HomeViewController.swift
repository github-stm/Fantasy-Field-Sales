//
//  HomeViewController.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var pageView: UIView?
    @IBOutlet weak var scrollView: UIScrollView?
    
    @IBOutlet weak var titleView: TitleView?
    @IBOutlet weak var tabView: ScrollTabView?
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var pageViewHeight: NSLayoutConstraint!

    var tabArray:[String]? = []
    
    var dataSource = FFSTableDataSource(footerType: .ViewFullTable)
    var pageController = HomePageViewController()
    
    
//    The solution to simultaneously handling the scroll view and the table view revolves around the UIScrollViewDelegate. Therefore, have your view controller conform to that protocol:

    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
//        let alert = MenuAlert(menuPosition: .Right)
//        alert.show(animated: true)
        
    }
    
    func addParallaxToView(vw: UIView) {
        let amount = 246
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
        
    }
    
   
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        if let frame = pageView?.frame {
            pageController.view.frame = frame
            pageController.delegateHomePageViewController = self
            pageView?.addSubview(pageController.view)
            pageController.didMove(toParentViewController: self)
        }

        
        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource
        
        titleView?.titleLabel?.text = "LATEST TOP STATS"
        
        tabView?.delegate = self
        scrollView?.delegate = self
        //Set table height to cover entire view
        //if navigation bar is not translucent, reduce navigation bar height from view height
        tableHeight.constant = (3  * Constants.leagueTable.rowHeight) + Constants.leagueTable.headerHeight + Constants.leagueTable.footerHeight
        self.tableView?.isScrollEnabled = false
        //no need to write following if checked in storyboard
        self.scrollView?.bounces = false
        self.tableView?.bounces = true

        tabView?.reloadData(data: Constants.teamGroup)
        
        addParallaxToView(vw: pageView!)
//        let parallaxViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 246)
//        self.pageView = ParallaxHeaderView(frame: parallaxViewFrame)

    }

  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        // Make the scroll of a TableView inside ScrollView behave naturally
        if let scrollView = self.scrollView, let tableView = self.tableView {  //height of all views above tableview
            tableView.isScrollEnabled = scrollView.contentOffset.y >= CGFloat(tableView.frame.origin.y)
        }
        
        if scrollView == self.tableView, let tableView = self.tableView  {
            tableView.isScrollEnabled = tableView.contentOffset.y > CGFloat(0)
        }

    }
    
}



extension HomeViewController: FFSTableDataSourceDelegate {
    
    func selectedItem(tableView: UITableView,  indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    internal func moreButtonTapped(){
        performSegue(withIdentifier: "homeFullTable", sender: self)
    }
}

extension HomeViewController: HomePageViewControllerDelegate {
    func homeNewsTapped() {
        performSegue(withIdentifier: "homeNews", sender: self)
    }
}

extension HomeViewController :ScrollTabViewDelegate {
    func selectedItem(indexPath: IndexPath) {
        print("2 header view indexpath row\(indexPath.row)")
    }
}

