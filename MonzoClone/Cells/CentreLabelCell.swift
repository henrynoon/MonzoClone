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
        setUpLabel()
        setUpSeparatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1)
        return view
    }()
    
    fileprivate func setUpLabel() {
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    fileprivate func setUpSeparatorView() {
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separatorView.anchor(top: nil , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 0))
    }
    
    var centreLabel: CentreLabel? {
        didSet {
            if let title = centreLabel?.title {
                mainLabel.text = title
            }
            if let colour = centreLabel?.colour {
                mainLabel.textColor = colour
            }
        }
    }
}
