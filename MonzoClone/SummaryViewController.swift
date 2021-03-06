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
    let summaryHeaderID = "summaryHeaderID"
    let footerID = "footerID"
    
    var allTransactions = [Transaction]() {
        didSet {
            print("We have received the transaction array")
        }
    }
    
    //N.B. - Hard coding these values for now. Will later make a screen for user to set them
    let transportBudget: Double = 100
    let groceriesBudget: Double = 30
    let eatingOutBudget: Double = 100
    let financesBudget: Double = 100
    let billsBudget: Double = 100
    let entertainmentBudget: Double = 100
    let holidaysBudget: Double = 100
    let shoppingBudget: Double = 65
    let generalBudget: Double = 20
    let expensesBudget: Double = 12
    let familyBudget: Double = 100
    let personalCareBudget: Double = 15
    
    //MARK:- Set-up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Summary"
        registerCells()
        sortByAmount()
    }
    
    var sortedCategoryArray = [Category]()
    
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
        transportCategory.spendingBudget = transportBudget
        transportCategory.transactions = groupTransactionsByCategory(category: "transport")
        
        let groceriesCategory = Category()
        groceriesCategory.categoryName = "Groceries"
        groceriesCategory.icon = "groceries"
        groceriesCategory.totalSpent = calculateTotalSpent(category: "groceries")
        groceriesCategory.spendingBudget = groceriesBudget
        groceriesCategory.transactions = groupTransactionsByCategory(category: "groceries")
        
        let eatingOutCategory = Category()
        eatingOutCategory.categoryName = "Eating Out"
        eatingOutCategory.icon = "eating_out"
        eatingOutCategory.totalSpent = calculateTotalSpent(category: "eating_out")
        eatingOutCategory.spendingBudget = eatingOutBudget
        eatingOutCategory.transactions = groupTransactionsByCategory(category: "eating_out")
        
        let financesCategory = Category()
        financesCategory.categoryName = "Finances"
        financesCategory.icon = "finances"
        financesCategory.totalSpent = calculateTotalSpent(category: "finances")
        financesCategory.spendingBudget = financesBudget
        financesCategory.transactions = groupTransactionsByCategory(category: "finances")
        
        let billsCategory = Category()
        billsCategory.categoryName = "Bills"
        billsCategory.icon = "bills"
        billsCategory.totalSpent = calculateTotalSpent(category: "bills")
        billsCategory.spendingBudget = billsBudget
        billsCategory.transactions = groupTransactionsByCategory(category: "bills")
        
        let entertainmentCategory = Category()
        entertainmentCategory.categoryName = "Entertainment"
        entertainmentCategory.icon = "entertainment"
        entertainmentCategory.totalSpent = calculateTotalSpent(category: "entertainment")
        entertainmentCategory.spendingBudget = entertainmentBudget
        entertainmentCategory.transactions = groupTransactionsByCategory(category: "entertainment")
        
        let holidaysCategory = Category()
        holidaysCategory.categoryName = "Holidays"
        holidaysCategory.icon = "holidays"
        holidaysCategory.totalSpent = calculateTotalSpent(category: "holidays")
        holidaysCategory.spendingBudget = holidaysBudget
        holidaysCategory.transactions = groupTransactionsByCategory(category: "holidays")
        
        let shoppingCategory = Category()
        shoppingCategory.categoryName = "Shopping"
        shoppingCategory.icon = "shopping"
        shoppingCategory.totalSpent = calculateTotalSpent(category: "shopping")
        shoppingCategory.spendingBudget = shoppingBudget
        shoppingCategory.transactions = groupTransactionsByCategory(category: "shopping")
        
        let generalCategory = Category()
        generalCategory.categoryName = "General"
        generalCategory.icon = "general"
        generalCategory.totalSpent = calculateTotalSpent(category: "general")
        generalCategory.spendingBudget = generalBudget
        generalCategory.transactions = groupTransactionsByCategory(category: "general")
        
        let expensesCategory = Category()
        expensesCategory.categoryName = "Expenses"
        expensesCategory.icon = "expenses"
        expensesCategory.totalSpent = calculateTotalSpent(category: "expenses")
        expensesCategory.spendingBudget = expensesBudget
        expensesCategory.transactions = groupTransactionsByCategory(category: "expenses")
        
        let familyCategory = Category()
        familyCategory.categoryName = "Family"
        familyCategory.icon = "family"
        familyCategory.totalSpent = calculateTotalSpent(category: "family")
        familyCategory.spendingBudget = familyBudget
        familyCategory.transactions = groupTransactionsByCategory(category: "family")
        
        let personalCareCategory = Category()
        personalCareCategory.categoryName = "Personal Care"
        personalCareCategory.icon = "personal_care"
        personalCareCategory.totalSpent = calculateTotalSpent(category: "personal_care")
        personalCareCategory.spendingBudget = personalCareBudget
        personalCareCategory.transactions = groupTransactionsByCategory(category: "personal_care")
        
        return [transportCategory, groceriesCategory, eatingOutCategory, financesCategory, billsCategory, entertainmentCategory, holidaysCategory, shoppingCategory, generalCategory, expensesCategory, familyCategory, personalCareCategory]
    }()
    
    
    fileprivate func sortByAmount() {
        
        let groupedCategoryObjects = Dictionary(grouping: categoryArray) { (element) -> Double in
            return element.totalSpent! //grouping by totalSpent
        }
        
        groupedCategoryObjects.keys.sorted(by: <).forEach { (key) in
            let values = groupedCategoryObjects[key]
            
            if key == 0 { //if totalSpent == 0, add all those Category objects to the array
                for i in 0...values!.count-1 {
                    sortedCategoryArray.append(values![i])
                }
            } else {
                let firstAndOnlyValue = values![0]
                sortedCategoryArray.append(firstAndOnlyValue)
            }
        }
    }

    
    fileprivate func groupTransactionsByCategory(category: String) -> [Transaction]  {
        
        let groupedTransactions = Dictionary(grouping: allTransactions) { (element) -> String in
            guard let category = element.merchant?.category else { return "There is no category element" }
            return category
        }
        
        let arrayofTransactions = groupedTransactions[category]
        return arrayofTransactions ?? []
    }
    
    fileprivate func calculateTotalSpent(category: String) -> Double {
        
        let transactionsInCategory = groupTransactionsByCategory(category: category)
        
        var totalSpentInCategory: Double = 0
        
        if transactionsInCategory.isEmpty {
            print("No transactions in \(category)")
        } else {
            let numOfTransactionsInCategory = transactionsInCategory.count
            for i in 0...numOfTransactionsInCategory-1 {
                
                if let amount = transactionsInCategory[i].amount {
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
        1
    }
    
    fileprivate func registerCells() {
        collectionView.register(LabelWithLabelCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: summaryHeaderID)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellID)
        collectionView.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    //MARK: - Creating Cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! CategoryCell
        cell.category = sortedCategoryArray[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sortedCategoryArray.count
    }
    
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 67.5)
    }
    
    //MARK: - Creating Headers and Footers
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            let summaryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: summaryHeaderID, for: indexPath) as! LabelWithLabelCell
            summaryHeader.labelWithLabel = summaryHeaderArray[indexPath.item]
            return summaryHeader

        } else { // It's a footer
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            return footer
        }
    }
    
    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 45)
    }
    
    
    //MARK: - Setting size of Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    //MARK: - Segue
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let categoryAtIndex = sortedCategoryArray[indexPath.item]
        
        let categoryTransactionVC = CategoryTransactionsViewController()
        
        categoryTransactionVC.selectedCategory = categoryAtIndex
        
        self.navigationController?.pushViewController(categoryTransactionVC, animated: true)
    }
}
