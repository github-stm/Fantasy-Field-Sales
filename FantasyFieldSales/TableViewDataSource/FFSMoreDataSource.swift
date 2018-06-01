//
//  FFSMoreDataSource.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 17/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit


@objc protocol FFSMoreDataSourceDelegate: class {
    func selectedItem(collectionView: UICollectionView,  indexPath: IndexPath)
    @objc optional func moreButtonTapped()
}



class FFSMoreDataSource: NSObject {

    fileprivate var array = Constants.teamGroup
    var delegate: FFSMoreDataSourceDelegate?
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func registerCells(forCollectionView collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "MoreCell", bundle: nil), forCellWithReuseIdentifier: "MoreCell")

    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func loadCell(atIndexPath indexPath: IndexPath, forCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        
        registerCells(forCollectionView: collectionView)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath) as! MoreCell
        self.configureCell(cell, indexPath:indexPath)
        return cell
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    fileprivate func configureCell(_ cell:MoreCell,  indexPath: IndexPath)
    {
        let ticket = array[indexPath.row]
        cell.topLabel?.text = ticket
        cell.bottomLabel?.text = ticket
    }
    
    
}


// ------------------------------------------------------------------------------------------------------------

extension FFSMoreDataSource : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.selectedItem(collectionView: collectionView,  indexPath: indexPath)
        }
    }
    
}

// ------------------------------------------------------------------------------------------------------------

extension FFSMoreDataSource : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return self.loadCell(atIndexPath: indexPath, forCollectionView: collectionView)
    }
    
    
}


