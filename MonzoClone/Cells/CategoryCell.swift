//
//  CategoryCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 21/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
