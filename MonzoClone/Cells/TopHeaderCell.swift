//
//  TopViewCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 27/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TopHeaderCell: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        setUpStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let priceLabel: UILabel = {
        let price = UILabel()
        price.text = "£18.04" //I will remove this hard-coded value later
        price.font = .systemFont(ofSize: 30, weight: .regular)
        price.textColor = .white
        return price
    }()
    
    let balanceLabel: UILabel = {
        let balance = UILabel()
        balance.text = "CARD BALANCE"
        balance.font = .systemFont(ofSize: 12, weight: .light)
        balance.textColor = UIColor(red: 0.63, green: 0.65, blue: 0.69, alpha: 1)
        return balance
    }()
    
    let amountSpentLabel: UILabel = {
        let amount = UILabel()
        amount.font = .systemFont(ofSize: 30, weight: .regular)
        amount.textColor = .white
        amount.text = "£10.15" //I will remove this hard-coded value later
        return amount
    }()
    
    let spentTodayLabel: UILabel = {
        let spent = UILabel()
        spent.font = .systemFont(ofSize: 12, weight: .light)
        spent.textColor = UIColor(red: 0.63, green: 0.65, blue: 0.69, alpha: 1)
        spent.text = "SPENT TODAY"
        return spent
    }()
    
    fileprivate func setUpStackViews() {
        
        let leftVerticalStackView = UIStackView(arrangedSubviews: [priceLabel, balanceLabel])
        leftVerticalStackView.axis = .vertical
        leftVerticalStackView.alignment = .leading
        leftVerticalStackView.spacing = 3
        
        let rightVerticalStackView = UIStackView(arrangedSubviews: [amountSpentLabel, spentTodayLabel])
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
