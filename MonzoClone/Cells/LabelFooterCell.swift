//
//  LabelFooterCell.swift
//  (Previously FooterCell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 17/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelFooterCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(displayP3Red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        addSubview(descriptionLabel)

        descriptionLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 30, left: 60, bottom: 0, right: 60))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(displayP3Red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var labelFooter: LabelFooter? {
        didSet {
            if let title = labelFooter?.title {
                descriptionLabel.text = title
            }
        }
    }
}
