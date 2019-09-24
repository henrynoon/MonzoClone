//
//  TransactionHeaderCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 24/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TransactionHeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
