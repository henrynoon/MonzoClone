//
//  TopViewCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 27/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TopHeaderCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
