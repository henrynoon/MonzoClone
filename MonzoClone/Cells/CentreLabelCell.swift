//
//  LabelCentralCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 20/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class CentreLabelCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1).cgColor
        self.layer.borderWidth = 0.5
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Improve name, location or logo"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    var centreLabel: CentreLabel? {
        didSet {
            mainLabel.text = centreLabel?.title
            mainLabel.textColor = centreLabel?.colour
        }
    }
}
