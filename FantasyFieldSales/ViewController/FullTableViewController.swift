//
//  FullTableViewController.swift
//  Diageo
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit
import ContactsUI
import RealmSwift

class FullTableViewController: UIViewController, UIPickerViewDelegate, CNContactPickerDelegate  {

    var dataSource = FFSTableDataSource()
    fileprivate let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var calendarBar: CalendarBar?
    
    var selectedItem:TeamData?
    
    // ------------------------------------------------------------------------------------------------------------
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        NotificationCenter.default.addObserver(self, selector:#selector(FullTableViewController.dateSelected(_:)), name: NSNotification.Name(rawValue: Constants.notification.dateSelectedNotification), object: nil)
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    @objc func dateSelected(_ notification: Notification){
        if let info = notification.userInfo, let infoDescription = info["date"] as? Date {
              calendarBar?.dateLabel?.text =  infoDescription.getMonthName()
            print(infoDescription)
        }
    }

    // ------------------------------------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource
        
    
        
        self.title =  Constants.text.stats.uppercased()
      //  iconCollectionView.selectItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), animated: false, scrollPosition: .None)
 
    }

    // ------------------------------------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ------------------------------------------------------------------------------------------------------------
    
    // A deinitializer is called immediately before a class instance is deallocated.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


}

// ------------------------------------------------------------------------------------------------------------

extension FullTableViewController: FFSTableDataSourceDelegate {
    
    func selectedItem(tableView: UITableView,  indexPath: IndexPath) {

        
        
        let  items = try! Realm().objects(TeamData.self)
        selectedItem = items[indexPath.row]

       // if indexPath.row < 5 {
        
            let chartViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChartViewController") as! ChartViewController
            chartViewController.selectedItem = selectedItem
            self.navigationController?.pushViewController(chartViewController, animated: true)
        
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        
//        } else {
//            let contactPickerViewController = CNContactPickerViewController()
//            contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
//            contactPickerViewController.delegate = self
//            present(contactPickerViewController, animated: true, completion: nil)
//        }
        
    }
}

