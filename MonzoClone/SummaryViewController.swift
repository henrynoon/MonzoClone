//
//  SummaryViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 04/12/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class SummaryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    let categoryCellID = "categoryCellID"
    let headerZeroID = "headerID"
    let summaryHeaderID = "summaryHeaderID"
    let footerID = "footerID"
    
    var allTransactions = [Transaction]() {
        didSet {
            print("We have received the transaction array")
//            groupTransactionsByCategory()
        }
    }
//    var transactionsGroupedByCategory = [[Transaction]]()
    
    //MARK:- Set-up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        registerCells()
    }
    
    lazy var summaryHeaderArray: [LabelWithLabel] = {
        let summaryHeader = LabelWithLabel()
        summaryHeader.title = "SUMMARY"
        return [summaryHeader]
    }()
    
    lazy var categoryArray: [Category] = {
       
        let transportCategory = Category()
        transportCategory.categoryName = "Transport"
        transportCategory.icon = "transport"
        transportCategory.totalSpent = calculateTotalSpent(category: "transport")
        
        let groceriesCategory = Category()
        groceriesCategory.categoryName = "Groceries"
        groceriesCategory.icon = "groceries"
        groceriesCategory.totalSpent = calculateTotalSpent(category: "groceries")
        
        let eatingOutCategory = Category()
        eatingOutCategory.categoryName = "Eating Out"
        eatingOutCategory.icon = "eating_out"
        eatingOutCategory.totalSpent = calculateTotalSpent(category: "eating_out")
        
        let financesCategory = Category()
        financesCategory.categoryName = "Finances"
        financesCategory.icon = "finances"
        financesCategory.totalSpent = calculateTotalSpent(category: "finances")
        
        let billsCategory = Category()
        billsCategory.categoryName = "Bills"
        billsCategory.icon = "bills"
        billsCategory.totalSpent = calculateTotalSpent(category: "bills")
        
        let entertainmentCategory = Category()
        entertainmentCategory.categoryName = "Entertainment"
        entertainmentCategory.icon = "entertainment"
        entertainmentCategory.totalSpent = calculateTotalSpent(category: "entertainment")
        
        let holidaysCategory = Category()
        holidaysCategory.categoryName = "Holidays"
        holidaysCategory.icon = "holidays"
        holidaysCategory.totalSpent = calculateTotalSpent(category: "holidays")
        
        let shoppingCategory = Category()
        shoppingCategory.categoryName = "Shopping"
        shoppingCategory.icon = "shopping"
        shoppingCategory.totalSpent = calculateTotalSpent(category: "shopping")
        
        let generalCategory = Category()
        generalCategory.categoryName = "General"
        generalCategory.icon = "general"
        generalCategory.totalSpent = calculateTotalSpent(category: "general")
        
        let expensesCategory = Category()
        expensesCategory.categoryName = "Expenses"
        expensesCategory.icon = "expenses"
        expensesCategory.totalSpent = calculateTotalSpent(category: "expenses")
        
        let familyCategory = Category()
        familyCategory.categoryName = "Family"
        familyCategory.icon = "family"
        familyCategory.totalSpent = calculateTotalSpent(category: "family")
        
        let personalCareCategory = Category()
        personalCareCategory.categoryName = "Personal Care"
        personalCareCategory.icon = "personal_care"
        personalCareCategory.totalSpent = calculateTotalSpent(category: "personal_care")
        
        return [transportCategory, groceriesCategory, eatingOutCategory, financesCategory, billsCategory, entertainmentCategory, holidaysCategory, shoppingCategory, generalCategory, expensesCategory, familyCategory, personalCareCategory]
        
        
        
    }()
    
    fileprivate func calculateTotalSpent(category: String?) -> Double {
        
        let groupedTransactions = Dictionary(grouping: allTransactions) { (element) -> String in
            guard let category = element.merchant?.category else { return "There is no category element" }
            return category
        }
        
        var totalSpentInCategory: Double = 0
        
        let transactionsInCategory = groupedTransactions[category!] //category always has a value...because I've hard coded it
        
        if let numOfTransactionsInCategory = transactionsInCategory?.count {
            for i in 0...numOfTransactionsInCategory-1 {
                
                if let amount = transactionsInCategory?[i].amount {
                    totalSpentInCategory += amount
                }
            }
        }
        return totalSpentInCategory
    }
    
    //MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK: - Registration
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    fileprivate func registerCells() {
          collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerZeroID)
        collectionView.register(LabelWithLabelCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: summaryHeaderID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
      }
    
    //MARK: - Creating Cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! CategoryCell
        cell.category = categoryArray[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return categoryArray.count
        }
    }
    
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 67.5)
    }
    
    //MARK: - Creating Headers and Footers
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            if indexPath.section == 0 {
                let headerZero = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerZeroID, for: indexPath)
                headerZero.backgroundColor = .red
                return headerZero
            } else {
                let headerOne = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: summaryHeaderID, for: indexPath) as! LabelWithLabelCell
                headerOne.labelWithLabel = summaryHeaderArray[indexPath.item]
                return headerOne
            }
            
            
        } else { // It's a footer
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            footer.backgroundColor = .yellow
            return footer
        }
    }
    
    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 200)
        } else {
            return CGSize(width: view.frame.width, height: 45)
        }
    }
    
    
    //MARK: - Setting size of Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: view.frame.width, height: 50)
        } else {
            return .zero
        }
    }
    
}
