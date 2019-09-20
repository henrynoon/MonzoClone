//
//  LabelWithIconCell.swift
//  (Previously PaymentInfoCell.swift)
//  (Previously SectionZeroCell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 11/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelWithIconCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1).cgColor
        self.layer.borderWidth = 0.5
        setUpStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9, weight: .light)
        label.textColor = UIColor(red: 0.44, green: 0.48, blue: 0.55, alpha: 1)
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
//        horizontalStackView.distribution = .fillProportionally
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 15, left: 16, bottom: 15, right: 16))
    }

    
    var labelWithIcon: LabelWithIcon? {
        didSet {
            iconImageView.image = UIImage(named: (labelWithIcon?.icon)!)
            mainLabel.text = labelWithIcon?.title
            subLabel.text = labelWithIcon?.subtitle
        }
    }
}
