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
    
    var dataSource = FFSTableDataSource(footerType: .ViewFullTable)
    var pageController = HomePageViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero
        for view in (self.scrollView?.subviews)! {
            contentRect = contentRect.union(view.frame)
            contentRect.size.height = view.frame.size.height - 65.0
    
        }
        self.scrollView?.contentSize = contentRect.size
 
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
       // dataSource.footerType = .ViewFullTable
        
       // self.tableView?.reloadData()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
    
extension HomeViewController: FFSTableDataSourceDelegate {
    
    func tableView(tableView: UITableView,  indexPath: IndexPath) {
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
    


