//
//  LabelHeaderCell.swift
//  (Previously ReuseSectionHeaderCell.swift)
//  (Previously ShareCostHeaderCell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 17/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelHeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(displayP3Red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1).cgColor
        addSubview(sectionLabel)
        sectionLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 15, bottom: 7.5, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(displayP3Red: 0.44, green: 0.48, blue: 0.55, alpha: 1)
        return label
    }()
    
    var labelHeader: LabelHeader? {
        didSet {
            if let title = labelHeader?.title {
                sectionLabel.text = title
            }
        }
    }
}
