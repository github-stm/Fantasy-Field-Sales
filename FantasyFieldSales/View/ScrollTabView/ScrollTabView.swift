//
//  ScrollTabView.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 15/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

protocol ScrollTabViewDelegate {
    func selectedItem(indexPath: IndexPath)
}



class ScrollTabView: UIView {
    var delegate: ScrollTabViewDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var contentView: UIView?
    
    var collectionArray:[String]? = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    //needed to set frame of xib  to correct size in swift 3
    override func layoutSubviews() {
        self.contentView?.frame = bounds
    }
    
    
    func commonInit(){
        
        let subviewArray = Bundle.main.loadNibNamed("ScrollTabView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
        
        contentView?.backgroundColor = UIColor.clear
        collectionView?.backgroundColor = UIColor.clear
        
        self.collectionView?.register(UINib(nibName: "ScrollTabCell", bundle: nil), forCellWithReuseIdentifier: "ScrollTabCell")
        self.collectionView?.showsHorizontalScrollIndicator = false
        
    }
    
    func scrollToNearestVisibleCollectionViewCell() {
        let visibleCenterPositionOfScrollView = Float((collectionView?.contentOffset.x)! + ((self.collectionView?.bounds.size.width)! / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        
        if let count = collectionView?.visibleCells.count {
            for i in 0..<count {
                let cell = collectionView?.visibleCells[i]
                let cellWidth = cell?.bounds.size.width
                let cellCenter = Float((cell?.frame.origin.x)! + cellWidth! / 2)
                
                // Now calculate closest cell
                let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
                if distance < closestDistance {
                    closestDistance = distance
                    closestCellIndex = (collectionView?.indexPath(for: cell!)!.row)!
                }
            }
            
            if closestCellIndex != -1 {
                self.collectionView!.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
    }
    
}


extension ScrollTabView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let collectionView = self.collectionView {
            return CGSize(width:120, height:collectionView.frame.size.height)
        }
        
        return CGSize(width:0, height:0)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}


extension ScrollTabView: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollToNearestVisibleCollectionViewCell()
        }
    }
    
}



extension ScrollTabView: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = collectionArray?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollTabCell", for: indexPath) as! ScrollTabCell
        self.configureCollectionCell(cell, indexPath:indexPath)
        return cell
    }
    
    // ------------------------------------------------------------------------------------------------------------
    
    func configureCollectionCell(_ cell:ScrollTabCell,  indexPath: IndexPath)
    {
        cell.titleLabel?.text = collectionArray?[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.selectedItem(indexPath: indexPath)
        }
    }

}
