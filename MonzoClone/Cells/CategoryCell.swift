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
    
    fileprivate func setUpLayout(rightPadding: CGFloat) {
        
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
        
        boldSlider.anchor(top: horizontalStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 7.5, left: 60, bottom: 11, right: 15+rightPadding))
        
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
                
                let roundedAmount = Int((-amount/100).rounded(.up))
                spentLabel.text = "£\(roundedAmount)"
                
                if let budget = category?.spendingBudget {
                    let amountInHundredths = -amount/100
                    
                    let fractionSpent = CGFloat(amountInHundredths/budget)
                    
                    let fractionLeftToSpend = 1-fractionSpent
                    
                    if fractionLeftToSpend < 0.2 {
                        backgroundSlider.backgroundColor = UIColor(red: 0.97, green: 0.85, blue: 0.86, alpha: 1)
                        boldSlider.backgroundColor = UIColor(red: 0.88, green: 0.29, blue: 0.34, alpha: 1)
                    }
                    
                    let screenWidth = self.bounds.width
                    let leftHandPadding = CGFloat(60)
                    let rightHandPadding = CGFloat(15)
                    
                    let startingSliderWidth = screenWidth - leftHandPadding - rightHandPadding
                    
                    let newSliderWidth = startingSliderWidth * fractionLeftToSpend
                    
                    let newPadding = startingSliderWidth - newSliderWidth // padding needs to increase by this amount
                    
                    setUpLayout(rightPadding: newPadding)
                    
                    subLabel.text =  "£\(calculateAmountLeft(amountSpent: amountInHundredths, budget: budget)) left of £\(Int(budget))"
                    
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
    
    func calculateAmountLeft(amountSpent: Double, budget: Double) -> Int {
        
        let amountLeftOver = budget-amountSpent
        
        if amountLeftOver < 0 {
            return 0
        } else {
            return Int(amountLeftOver)
        }
    }
}
