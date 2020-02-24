//
//  Category.swift
//  MonzoClone
//
//  Created by Henry Noon on 24/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class Category: NSObject {

    var categoryName: String?
    var icon: String?
    var totalSpent: Double?
    var spendingBudget: String?
    var amountLeftToSpend: String?
    var transactions: [Transaction]?
}
