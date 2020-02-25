//
//  SegmentedControlHeaderCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 25/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class SegmentedControlHeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .green
        
        addSubview(segmentedControl)
        segmentedControl.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Category", "Emoji", "Location"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    
}
