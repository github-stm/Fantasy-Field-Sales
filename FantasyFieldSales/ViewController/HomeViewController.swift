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
    var newsImageName = ""
    var currentPage = 0
    var dataSource = FFSTableDataSource(footerType: .ViewFullTable)
    var pageController = HomePageViewController()
    
    

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
//        let alert = MenuAlert(menuPosition: .Right)
//        alert.show(animated: true)
        
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
        
        titleView?.titleLabel?.text = Constants.text.stats.uppercased()
        
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

    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeNews" {
            if let vc = segue.destination as? NewsViewController {
               // print(brandName)
                vc.newsImageName = self.newsImageName
            }
        }
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
           /// tableView.isScrollEnabled = scrollView.contentOffset.y >= CGFloat(tableView.frame.origin.y)
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
    func homeNewsTapped(currentPage:Int) {
        newsImageName = Constants.backgroundImageContent[currentPage]
        performSegue(withIdentifier: "homeNews", sender: self)
    }
}

extension HomeViewController :ScrollTabViewDelegate {
    func selectedItem(indexPath: IndexPath) {
        print("header view indexpath row\(indexPath.row)")
    }
}

