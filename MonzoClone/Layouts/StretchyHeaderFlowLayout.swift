//
//  HeaderFlowLayout.swift
//  MonzoClone
//
//  Created by Henry Noon on 09/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class StretchyHeaderFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
//                print(contentOffsetY)
                
                if contentOffsetY > 0 { //ie pushing the content up
                    return
                }
                
                let height = attributes.frame.height - contentOffsetY
                let width = collectionView.frame.width
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
