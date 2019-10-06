//
//  StickyHeaderFlowLayout.swift
//  MonzoClone
//
//  Created by Henry Noon on 06/10/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class StickyHeaderFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.sectionHeadersPinToVisibleBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
