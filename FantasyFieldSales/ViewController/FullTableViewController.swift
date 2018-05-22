//
//  FullTableViewController.swift
//  Diageo
//
//  Created by Clive Brown on 09/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit
import ContactsUI

class FullTableViewController: UIViewController, UIPickerViewDelegate, CNContactPickerDelegate  {

    var dataSource = FFSTableDataSource()
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource
        
    
      //  iconCollectionView.selectItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), animated: false, scrollPosition: .None)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension FullTableViewController: FFSTableDataSourceDelegate {
    
    func selectedItem(tableView: UITableView,  indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        if indexPath.row < 5 {
        
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChartViewController") as! ChartViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
        
        } else {
            let contactPickerViewController = CNContactPickerViewController()
            
            contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
            
            contactPickerViewController.delegate = self
            
            present(contactPickerViewController, animated: true, completion: nil)
        }
        
        /*
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: CNContactFormatterStyle.fullName), CNContactEmailAddressesKey, CNContactBirthdayKey, CNContactImageDataKey] as [Any]
        
        let selectedContact = contacts[0]
        
        if selectedContact.areKeysAvailable([CNContactViewController.descriptorForRequiredKeys()]) {
            let contactViewController = CNContactViewController(forContact: selectedContact)
            contactViewController.contactStore = AppDelegate.getAppDelegate().contactStore
            contactViewController.displayedPropertyKeys = keys
            navigationController?.pushViewController(contactViewController, animated: true)
        }
        else {
            AppDelegate.getAppDelegate().requestForAccess(completionHandler: { (accessGranted) -> Void in
                if accessGranted {
                    do {
                        let contactRefetched = try AppDelegate.getAppDelegate().contactStore.unifiedContactWithIdentifier(selectedContact.identifier, keysToFetch: [CNContactViewController.descriptorForRequiredKeys()])
                        
                      //  dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        DispatchQueue.main.async {  () -> Void in
                            let contactViewController = CNContactViewController(forContact: contactRefetched)
                            contactViewController.contactStore = AppDelegate.getAppDelegate().contactStore
                            contactViewController.displayedPropertyKeys = keys
                            self.navigationController?.pushViewController(contactViewController, animated: true)
                        }
                    }
                    catch {
                        print("Unable to refetch the selected contact.", separator: "", terminator: "\n")
                    }
                }
            })
        }
        */
    }
}

