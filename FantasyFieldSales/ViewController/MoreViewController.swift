//
//  MoreViewController.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 16/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView?
    
    
    var dataSource = FFSMoreDataSource()
    
    

    let padding: CGFloat = 25
    
    let moreList = Constants.teamGroup
    
    let collectionViewCellHeight:CGFloat = 120
    let collectionViewPadding:CGFloat = 30.0
    let collectionViewHeaderSectionHeight:CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataSource.delegate = self
        self.collectionView?.delegate = self.dataSource
        self.collectionView?.dataSource = self.dataSource
        
       // self.collectionView?.register(UINib(nibName: "MoreCell", bundle: nil), forCellWithReuseIdentifier: "MoreCell")
        collectionView?.backgroundColor = UIColor.clear
        
 
        
        let alert = CustomAlert(title: "Hello there!! 👋🏻👋🏻", image: UIImage(named: "starOn")!)
        alert.show(animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}


extension MoreViewController: FFSMoreDataSourceDelegate {
    
   func selectedItem(collectionView: UICollectionView,  indexPath: IndexPath){
        print("\(indexPath.row)")
        
    }
}
