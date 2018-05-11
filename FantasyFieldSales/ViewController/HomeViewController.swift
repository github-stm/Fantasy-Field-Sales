//
//  HomeViewController.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let leagueTableCellIdentifier = "LeagueTableCell"

    var teamList = Constants.teams
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var pageView: UIView?
    @IBOutlet weak var scrollView: UIScrollView?
    
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

        tableView?.register(UINib(nibName: "LeagueTableCell", bundle: nil), forCellReuseIdentifier: leagueTableCellIdentifier)

    }

    
    func addParallaxToView(vw: UIView) {
        let amount = 300
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    fileprivate func performFullTableSegue(){
        performSegue(withIdentifier: "homeFullTable", sender: self)
    }
    
}
    


extension HomeViewController: HomePageViewControllerDelegate {
    
    func homeNewsTapped() {
        performSegue(withIdentifier: "homeNews", sender: self)
    }
}
    


extension HomeViewController:UIScrollViewDelegate {
//     func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let headerView = self.pageView as! ParallaxHeaderView
//        headerView.scrollViewDidScroll(scrollView: scrollView)
//    }
}
extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = LeagueTableHeaderView()
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = LeagueTableMoreFooterView()
        footerView.delegate = self
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 105
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 75
    }
}


extension HomeViewController: LeagueTableMoreFooterViewDelegate {
    
    func moreButtonTapped() {
        performFullTableSegue()
    }
}
extension HomeViewController: UITableViewDataSource {
    // ------------------------------------------------------------------------------------------------------------
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: leagueTableCellIdentifier, for: indexPath) as! LeagueTableCell
        
        self.configureCell(cell, indexPath:indexPath)
        return cell
    }

    // ------------------------------------------------------------------------------------------------------------
    
    func configureCell(_ cell:LeagueTableCell,  indexPath: IndexPath)
    {
        let team = teamList[indexPath.row]
        cell.positionLabel?.text = String(team.pos)
        cell.teamLabel?.text = team.team
        cell.pointsLabel?.text = String(team.points)

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

}
