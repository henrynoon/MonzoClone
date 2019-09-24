//
//  LabelWithIconCell.swift
//  (Previously PaymentInfoCell.swift)
//  (Previously SectionZeroCell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 11/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//
/*
 
 Reverting back to how LabelWithIconCell previously was. Because...
 The separatorView has padding of 60 when displayed in TransactionViewController
 But would need padding of just 15 when displayed in HomeViewController
 I could change this class to enable this difference between the VCs
 But it adds another layer of complexity
 For simplicity, I'm going to create another class for the cells in HomeViewController
 
 */

import UIKit

class LabelWithIconCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        containerView.addSubview(rightIconImageView)
        setUpStackViews()
        setUpSeparatorView()
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
    
    let leftIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return icon
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }()
    
    let rightIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.frame = CGRect(x: 15, y: 7.5, width: 15, height: 15)
        return icon
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1)
        return view
    }()
    
    fileprivate func setUpStackViews() {
        let verticalStackView = UIStackView(arrangedSubviews: [mainLabel,subLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 3
        verticalStackView.alignment = .leading
    
        let horizontalStackView = UIStackView(arrangedSubviews: [leftIconImageView, verticalStackView, containerView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 14.75, left: 15, bottom: 14.75, right: 15))
    }
    
    
    fileprivate func setUpSeparatorView() {
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separatorView.anchor(top: nil , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 60, bottom: 0, right: 0))
    }

    
    override var isHighlighted: Bool {
        didSet {
            let duration = isHighlighted ? 0.00001 : 3
            let highlightColor = isHighlighted ?
                UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1) : UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            let animations = {
                self.backgroundColor = highlightColor
            }
            
            UIView.animate(withDuration: duration,
                           delay: 0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 0.0,
                           options: [.allowUserInteraction, .beginFromCurrentState],
                           animations: animations,
                           completion: nil)
        }
    }
    
    var labelWithIcon: LabelWithIcon? {
        didSet {
            if let leftIcon = labelWithIcon?.leftIcon {
                leftIconImageView.image = UIImage(named: leftIcon)
            }
            if let title = labelWithIcon?.title {
                mainLabel.text = title
            }
            if let subtitle = labelWithIcon?.subtitle {
                subLabel.text = subtitle
            }
            if let rightIcon = labelWithIcon?.rightIcon {
                rightIconImageView.image = UIImage(named: rightIcon)
            }
        }
    }
}
