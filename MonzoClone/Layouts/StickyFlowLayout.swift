//
//  StickyHeaderFlowLayout.swift
//  MonzoClone
//
//  Created by Henry Noon on 06/10/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class StickyFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.sectionHeadersPinToVisibleBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionFooter {
               
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
                
                let width = collectionView.frame.width
                
                if contentOffsetY < 0 { //ie pulling the content down
                    return
                }
                
                let height = attributes.frame.height + contentOffsetY
                attributes.frame = CGRect(x: 0, y: attributes.frame.minY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }


}
