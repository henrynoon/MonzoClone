//
//  LabelWithSwitchCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 20/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelWithSwitchCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
        label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        return label
    }()
    
    let switchToggle: UISwitch = {
        let toggle = UISwitch()
        return toggle
    }()
    
    fileprivate func setUpStackViews() {
        
        let verticalStackView = UIStackView(arrangedSubviews: [mainLabel, subLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 3
        
        let horizontalStackView = UIStackView(arrangedSubviews: [verticalStackView, switchToggle])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalCentering
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 15, left: 15, bottom: 15, right: 15))
    }
    
    var labelWithSwitch: LabelWithSwitch? {
        didSet {
            if let title = labelWithSwitch?.title {
                mainLabel.text = title
            }
            if let subtitle = labelWithSwitch?.subtitle {
                subLabel.text = subtitle
            }
        }
    }
}
