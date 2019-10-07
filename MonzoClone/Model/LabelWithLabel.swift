//
//  LabelWithLabel.swift
//  MonzoClone
//
//  Created by Henry Noon on 20/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class LabelWithLabel: NSObject {
    
    var title: String?
    var subtitle: String?
    var detail: String?

    func formatCurrency(amount: Double, currency: String) {
        
        let amountInHundredths = amount/100
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = currency
        
        if amountInHundredths < 0 {
            self.detail = numberFormatter.string(from: -amountInHundredths as NSNumber)
        } else {
            self.detail = numberFormatter.string(from: amountInHundredths as NSNumber)
        }
    }
}
