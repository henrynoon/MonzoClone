//
//  TransactionCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 24/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
        label.text = "Sainsbury's"
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9, weight: .light)
        label.textColor = UIColor(red: 0.44, green: 0.48, blue: 0.55, alpha: 1)
        label.text = "Some comment"
        return label
    }()
    
    let logoImageView: UIImageView = {
        let logo = UIImageView(image: #imageLiteral(resourceName: "Sainsbury's Logo"))
        logo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        logo.layer.cornerRadius = 8
        logo.clipsToBounds = true
        return logo
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "£5.45"
        return label
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
        
        let horizontalStackView = UIStackView(arrangedSubviews: [logoImageView, verticalStackView, rightLabel])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 14.75, left: 15, bottom: 14.75, right: 15))
    }
    
    fileprivate func setUpSeparatorView() {
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separatorView.anchor(top: nil , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 0))
    }

    
}
