//
//  SectionZeroCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 11/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class SectionZeroCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        addSubview(infoLabel)
        infoLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "These are the three cells in section 0"
        return label
    }()
}
