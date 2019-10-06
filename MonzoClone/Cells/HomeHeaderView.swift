//
//  HomeHeaderView.swift
//  (Previously TopHeaderCell.swift)
//  (PreviouslyTopViewCell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 27/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        setUpStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardBalanceLabel: UILabel = {
        let cardBalance = UILabel()
        cardBalance.font = .systemFont(ofSize: 30, weight: .regular)
        cardBalance.textColor = .white
        return cardBalance
    }()
    
    let balanceLabel: UILabel = {
        let balance = UILabel()
        balance.text = "CARD BALANCE"
        balance.font = .systemFont(ofSize: 12, weight: .light)
        balance.textColor = UIColor(red: 0.63, green: 0.65, blue: 0.69, alpha: 1)
        return balance
    }()
    
    let amountSpentTodayLabel: UILabel = {
        let amount = UILabel()
        amount.font = .systemFont(ofSize: 30, weight: .regular)
        amount.textColor = .white
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
        
        let leftVerticalStackView = UIStackView(arrangedSubviews: [cardBalanceLabel, balanceLabel])
        leftVerticalStackView.axis = .vertical
        leftVerticalStackView.alignment = .leading
        leftVerticalStackView.spacing = 3
        
        let rightVerticalStackView = UIStackView(arrangedSubviews: [amountSpentTodayLabel, spentTodayLabel])
        rightVerticalStackView.axis = .vertical
        rightVerticalStackView.spacing = 3
        rightVerticalStackView.alignment = .trailing
        
        let horizontalStackView = UIStackView(arrangedSubviews: [leftVerticalStackView, rightVerticalStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalSpacing
        
        addSubview(horizontalStackView)
        horizontalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 15, right: 15))
    }
    
    
    var balance: Balance? {
        didSet {
            
            guard let currency = balance?.currency else {return}
           
            if let cardBalance = balance?.balance {
                cardBalanceLabel.formatCurrency(amount: cardBalance, currency: currency)
            }
            
            if let amountSpent = balance?.spend_today {
                amountSpentTodayLabel.formatCurrency(amount: amountSpent, currency: currency)
            }
        }
    }
}
