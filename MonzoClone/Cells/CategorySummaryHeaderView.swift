//
//  CategorySummaryHeaderView.swift
//  MonzoClone
//
//  Created by Henry Noon on 26/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class CategorySummaryHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        setUpStackViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let amountLeftLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        label.text = "£13"
        return label
    }()
    
    let leftOfAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "CARD BALANCE"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        label.text = "LEFT OF £50"
        return label
    }()
    
    let amountSpentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        label.text = "£37"
        return label
    }()
    
    let thisPeriodLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        label.text = "THIS PERIOD"
        return label
    }()
    
    fileprivate func setUpStackViews() {
        
        let leftVerticalStackView = UIStackView(arrangedSubviews: [amountLeftLabel, leftOfAmountLabel])
        leftVerticalStackView.axis = .vertical
        leftVerticalStackView.alignment = .leading
        leftVerticalStackView.spacing = 3
        
        let rightVerticalStackView = UIStackView(arrangedSubviews: [amountSpentLabel, thisPeriodLabel])
        rightVerticalStackView.axis = .vertical
        rightVerticalStackView.spacing = 3
        rightVerticalStackView.alignment = .trailing
        
        let horizontalStackView = UIStackView(arrangedSubviews: [leftVerticalStackView, rightVerticalStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalSpacing
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 15, right: 15))
    }
    
    
}
