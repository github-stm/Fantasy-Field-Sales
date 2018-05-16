//
//  DSSCollectionViewFlowLayout.swift
//  FantasyFieldSales
//
//  Created by Cee Bee on 16/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

@objc(DSSCollectionViewFlowLayout)

class DSSCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare () {
        super.prepare()
        
        var contentByItems: ldiv_t
        
        let contentSize = self.collectionViewContentSize
        let itemSize = self.itemSize
        
        if UICollectionViewScrollDirection.vertical == self.scrollDirection {
            contentByItems = ldiv (Int(contentSize.width), Int(itemSize.width))
        } else {
            contentByItems = ldiv (Int(contentSize.height), Int(itemSize.height))
        }
        
        let layoutSpacingValue = CGFloat(NSInteger (CGFloat(contentByItems.rem))) / CGFloat (contentByItems.quot + 1)
        
        let originalMinimumLineSpacing = self.minimumLineSpacing
        let originalMinimumInteritemSpacing = self.minimumInteritemSpacing
        let originalSectionInset = self.sectionInset
        
        if layoutSpacingValue != originalMinimumLineSpacing ||
            layoutSpacingValue != originalMinimumInteritemSpacing ||
            layoutSpacingValue != originalSectionInset.left ||
            layoutSpacingValue != originalSectionInset.right ||
            layoutSpacingValue != originalSectionInset.top ||
            layoutSpacingValue != originalSectionInset.bottom {
            
            let insetsForItem = UIEdgeInsets.init(top: layoutSpacingValue, left: layoutSpacingValue, bottom: layoutSpacingValue, right: layoutSpacingValue)
            
            self.minimumLineSpacing = layoutSpacingValue
            self.minimumInteritemSpacing = layoutSpacingValue
            self.sectionInset = insetsForItem
        }
    }
}
