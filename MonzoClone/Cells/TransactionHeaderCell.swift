//
//  TransactionHeaderCell.swift
//  MonzoClone
//
//  Created by Henry Noon on 24/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TransactionHeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1).cgColor
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 5, left: 15, bottom: 5, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return label
    }()
    
    var transaction: Transaction? {
        didSet {
            if let date = transaction?.created {
                dateLabel.formatDateWithoutTime(date: date)
            }
        }
    }
}


