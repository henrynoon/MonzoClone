//
//  SectionZeroCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 11/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelWithIconCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStackViews()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1).cgColor
        self.layer.borderWidth = 0.5

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Main label"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Sub-Label Sub-Label Sub-Label Sub-Label"
        label.font = .systemFont(ofSize: 8, weight: .light)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let icon = UIImageView(image: #imageLiteral(resourceName: "Receipt Icon"))
        let iconSize = CGSize(width: 30, height: 30)
        icon.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true
        icon.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        return icon
    }()
    
    fileprivate func setUpStackViews() {
        
        let verticalStackView = UIStackView(arrangedSubviews: [mainLabel,subLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 3
        
        let horizontalStackView = UIStackView(arrangedSubviews: [iconImageView, verticalStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 16
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 16, bottom: 10, right: 10))
        
    }

    
    var paymentInfo: PaymentInfo? {
        didSet {
            iconImageView.image = UIImage(named: (paymentInfo?.usefulIcon)!)
            mainLabel.text = paymentInfo?.title
        }
    }
}
