//
//  GridCollectionViewFlowLayout.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import UIKit

class GridCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func collectionViewContentSize() -> CGSize {
        
        if let cv = self.collectionView {
            
            let xSize = CGFloat(cv.numberOfItemsInSection(0)) * blockSize
            let ySize = CGFloat(cv.numberOfSections()) * blockSize
            
            return CGSizeMake(xSize, ySize)
        }
        
        return CGSizeMake(0, 0)
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
        attributes.size = CGSizeMake(blockSize, blockSize)
        let xValue = blockSize / 2 + (CGFloat(indexPath.row) * blockSize)
        let yValue = blockSize / 2 + (CGFloat(indexPath.section) * blockSize)
        attributes.center = CGPointMake(xValue, yValue)
        
        attributes.zIndex = (indexPath.section * -1) + 6
        
        return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        
        let minRow = NSInteger((rect.origin.x < 0) ? rect.origin.x / blockSize : 0)
        let maxRow = NSInteger(rect.size.width / blockSize + CGFloat(minRow))
        let attributes = NSMutableArray()
        
        if let cv = self.collectionView {
            
            for (var i: NSInteger = 0; i < cv.numberOfSections(); i++) {
                
                for (var j: NSInteger = minRow; j < maxRow; j++) {
                    
                    let indexPath = NSIndexPath(forItem: j, inSection: i)
                    attributes.addObject(self.layoutAttributesForItemAtIndexPath(indexPath))
                }
            }
        }
        return attributes as [AnyObject]
    }
}