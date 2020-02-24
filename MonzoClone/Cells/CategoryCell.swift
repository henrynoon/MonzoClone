//
//  CategoryCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 21/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let categoryImageView: UIImageView = {
        let categoryIcon = UIImageView()
        categoryIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        categoryIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        categoryIcon.layer.cornerRadius = 8
        categoryIcon.clipsToBounds = true
        categoryIcon.layer.borderWidth = 0.5
        categoryIcon.layer.borderColor = UIColor(red: 0.44, green: 0.48, blue: 0.55, alpha: 1).cgColor
        return categoryIcon
    }()
    
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
    
    let spentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return label
    }()
    
    let backgroundSlider: UIView = {
        let backgroundSlider = UIView()
        backgroundSlider.backgroundColor = UIColor(red: 0.82, green: 0.83, blue: 0.85, alpha: 1)
        backgroundSlider.layer.cornerRadius = 5
        backgroundSlider.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return backgroundSlider
    }()
    
    let boldSlider: UIView = {
        let boldSlider = UIView()
        boldSlider.backgroundColor = UIColor(red: 0.09, green: 0.14, blue: 0.23, alpha: 1)
        boldSlider.layer.cornerRadius = 8
        boldSlider.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return boldSlider
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    
    fileprivate func setUpLayout() {
        
        let middleVerticalStackView = UIStackView(arrangedSubviews: [mainLabel, subLabel])
        middleVerticalStackView.axis = .vertical
        middleVerticalStackView.spacing = 3
        middleVerticalStackView.alignment = .leading
        
        let horizontalStackView = UIStackView(arrangedSubviews: [categoryImageView, middleVerticalStackView, spentLabel])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        
        addSubview(horizontalStackView)
        addSubview(backgroundSlider)
        addSubview(separatorView)
        addSubview(boldSlider)
    
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 15, bottom: 7.5, right: 15))
        
        backgroundSlider.anchor(top: horizontalStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 7.5, left: 60, bottom: 11, right: 15))
        
        boldSlider.anchor(top: horizontalStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 7.5, left: 60, bottom: 11, right: 60))
        
        separatorView.anchor(top: nil , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 0))
    }
    
    var category: Category? {
        didSet {
            
            if let name = category?.categoryName {
                mainLabel.text = name
            }
            
            if let icon = category?.icon {
                categoryImageView.image = UIImage(named: icon)
            }
            
            if let amount = category?.totalSpent {
                spentLabel.formatCurrency(amount: amount, currency: "GBP")
                
                if amount.isZero {
                    categoryImageView.alpha = 0.42
                    mainLabel.alpha = 0.42
                    subLabel.alpha = 0.42
                    subLabel.text = "No transactions"
                    spentLabel.alpha = 0
                }
            }
        }
    }
}
