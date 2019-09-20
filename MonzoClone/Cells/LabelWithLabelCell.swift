//
//  LabelWithLabelCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 20/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelWithLabelCell: UICollectionViewCell {
    
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
        label.text = "Average spend"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "143 payments"
        label.font = .systemFont(ofSize: 9, weight: .light)
        label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        return label
    }()
    
    let infoLabel: UILabel = {
        let price = UILabel()
        price.text = "£7.93"
        price.font = .systemFont(ofSize: 20, weight: .light)
        price.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return price
    }()
    
    fileprivate func setUpStackViews() {
        
        let verticalStackView = UIStackView(arrangedSubviews: [mainLabel, subLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 3
        
        let horizontalStackView = UIStackView(arrangedSubviews: [verticalStackView, infoLabel])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalCentering
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 15, left: 16, bottom: 15, right: 16))
    }
    
    var labelWithLabel: LabelWithLabel? {
        didSet {
            mainLabel.text = labelWithLabel?.title
            subLabel.text = labelWithLabel?.subtitle
            infoLabel.text = labelWithLabel?.detail
        }
    }
}
