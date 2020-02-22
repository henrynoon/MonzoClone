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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let categoryImageView: UIImageView = {
        let categoryIcon = UIImageView()
        categoryIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        categoryIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        categoryIcon.layer.cornerRadius = 15
        categoryIcon.clipsToBounds = true
        categoryIcon.layer.borderWidth = 0.5
        categoryIcon.layer.borderColor = UIColor(red: 0.44, green: 0.48, blue: 0.55, alpha: 1).cgColor
        categoryIcon.image = UIImage(named: "groceries")
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
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return label
    }()
    
    let backgroundSlider: UIView = {
        let backgroundSlider = UIView()
        backgroundSlider.backgroundColor = UIColor(red: 0.82, green: 0.83, blue: 0.85, alpha: 1)
        backgroundSlider.layer.cornerRadius = 8
        return backgroundSlider
    }()
    
    let boldSlider: UIView = {
        let boldSlider = UIView()
        boldSlider.backgroundColor = UIColor(red: 0.09, green: 0.14, blue: 0.23, alpha: 1)
        boldSlider.layer.cornerRadius = 8
        return boldSlider
    }()
    
    let movingTicker: UIView = {
        let movingTicker = UIView()
        movingTicker.backgroundColor = UIColor(red: 0.82, green: 0.83, blue: 0.85, alpha: 1)
        movingTicker.heightAnchor.constraint(equalToConstant: 10).isActive = true
        movingTicker.widthAnchor.constraint(equalToConstant: 1).isActive = true
        return movingTicker
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1)
        return view
    }()
}
