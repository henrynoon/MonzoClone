//
//  SectionZeroCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 11/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class PaymentInfoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Groceries"
        return label
    }()
    
    let usefulIcon: UIImageView = {
        let icon = UIImageView(image: #imageLiteral(resourceName: "Sainsbury's Logo"))
        let iconSize = CGSize(width: 30, height: 30)
        icon.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true
        icon.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        return icon
    }()
    
    fileprivate func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [usefulIcon, infoLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 16, bottom: 10, right: 10))
    }
}
