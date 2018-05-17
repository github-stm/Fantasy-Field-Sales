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

    let padding: CGFloat = 25
    
    let moreList = Constants.teamGroup
    
    let collectionViewCellHeight:CGFloat = 120
    let collectionViewPadding:CGFloat = 30.0
    let collectionViewHeaderSectionHeight:CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.collectionView?.register(UINib(nibName: "MoreCell", bundle: nil), forCellWithReuseIdentifier: "MoreCell")
        collectionView?.backgroundColor = UIColor.clear

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}

// ------------------------------------------------------------------------------------------------------------

extension MoreViewController : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return moreList.count
        
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath) as! MoreCell

        self.configureCollectionCell(cell, indexPath:indexPath)
        
        return cell
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func configureCollectionCell(_ cell:MoreCell,  indexPath: IndexPath)
    {
        
        let ticket = moreList[indexPath.row]
        cell.topLabel?.text = ticket
        cell.bottomLabel?.text = ticket
       
        
    }
    
}

