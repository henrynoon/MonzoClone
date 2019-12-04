//
//  TransactionViewController.swift
//  (Previously InfoViewController.swift)
//  MonzoClone
//
//  Created by Henry Noon on 04/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class TransactionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    
    let labelWithIconCellID = "labelWithIconCellID"
    let labelWithSwitchCellID = "labelWithSwitchCellID"
    let labelWithLabelCellID = "labelWithLabelCellID"
    let centreLabelCellID = "centreLabelCellID"
    let largeHeaderCellID = "largeHeaderCellID"
    let labelHeaderCellID = "labelHeaderCellID"
    let labelFooterCellID = "labelFooterCellID"
    
    var selectedTransaction: Transaction?
    var allTransactions = [Transaction]()
    var categoryNotesReceiptArray = [LabelWithIcon]()
    var historyHeaderArray = [LabelHeader]()
    var historyArray = [LabelWithLabel]()
    var footerContentArray = [LabelFooter]()
    
    var shareCostHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SHARE THE COST"
        return [header]
    }()
    
    var shareCostArray: [LabelWithIcon] = {
        var sharedTab = LabelWithIcon()
        sharedTab.title = "Add to Shared Tab"
        sharedTab.subtitle = "A simple way to manage shared expenses"
        sharedTab.leftIcon = "Tab Icon"
        
        var splitBill = LabelWithIcon()
        splitBill.leftIcon = "Bill Icon"
        splitBill.title = "Split this bill"
        splitBill.subtitle = "Instantly get paid back by your friends"
        
        return [sharedTab, splitBill]
    }()
    
    var subscriptionsHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SUBSCRIPTIONS"
        return [header]
    }()
    
    var subscriptionsArray: [LabelWithSwitch] = {
        var repeatingPayment = LabelWithSwitch()
        repeatingPayment.title = "Repeating payment"
        repeatingPayment.subtitle = "We'll predict this for you in Summary"
        return [repeatingPayment]
    }()
    
    var optionHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "TRANSACTION OPTIONS"
        return [header]
    }()
    
    var optionArray: [LabelWithSwitch] = {
        var excludeFromSummary = LabelWithSwitch()
        excludeFromSummary.title = "Exclude from Summary"
        excludeFromSummary.subtitle = "Hide this payment from your total spending"
        return [excludeFromSummary]
    }()
    
    var feedbackArray: [CentreLabel] = {
        var improveName = CentreLabel()
        improveName.title = "Improve name, location or logo"
        improveName.colour = UIColor(red: 0, green: 0.64, blue: 0.86, alpha: 1)
        
        var somethingWrong = CentreLabel()
        somethingWrong.title = "Something Wrong? Tell Us!"
        somethingWrong.colour = UIColor(red: 0.82, green: 0.24, blue: 0.31, alpha: 1)
        
        return [improveName, somethingWrong]
    }()
    
    
    //MARK:- Set-up
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        setUpCategoryNotesReceiptCells()
        setUpHistoryHeader()
        setUpHistoryCells()
        setUpFooterLabel()
        registerCells()
        setUpTransactionDate()
    }
    
    fileprivate func setUpCategoryNotesReceiptCells() {
        
        let categoryObj = LabelWithIcon()
        categoryObj.title = selectedTransaction?.merchant?.category?.capitalized.replacingOccurrences(of: "_", with: " ")
        categoryObj.leftIcon = selectedTransaction?.merchant?.category
        categoryObj.rightIcon = "Arrow"
        
        let notesObj = LabelWithIcon()
        notesObj.leftIcon = "Notes Icon"
        notesObj.rightIcon = "Arrow"
        
        if let notes = selectedTransaction?.notes {
            if notes == " " {
                notesObj.title = "Add notes and #tags"
            } else {
                notesObj.title = notes
            }
        }
        
        let receiptObj = LabelWithIcon()
        receiptObj.leftIcon = "Receipt Icon"
        receiptObj.rightIcon = "Arrow"
        
        if let attachments = selectedTransaction?.attachments {
            // add a thumbnail of attachment
        } else {
            receiptObj.title = "Add receipt"
        }
        
        [categoryObj, notesObj, receiptObj].forEach {categoryNotesReceiptArray.append($0)}
    }
    
    fileprivate func setUpFooterLabel() {
        let footerObj = LabelFooter()
        footerObj.title = selectedTransaction?.transactionDescription?.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
        footerContentArray.append(footerObj)
    }
    
    fileprivate func setUpHistoryHeader() {
        
        let historyLabel = LabelHeader()
        
        if let shopName = selectedTransaction?.merchant?.name?.uppercased() {
            historyLabel.title = shopName + " HISTORY"
        }
        historyHeaderArray.append(historyLabel)
    }
    
    
    fileprivate func setUpHistoryCells() {
        
        var groupedTransactions = Dictionary(grouping: allTransactions) { (element) -> String in
            return element.merchant!.name!
        }
        
        guard let name = selectedTransaction?.merchant?.name else {return}
        guard let currency = selectedTransaction?.currency else {return}
        
        var totalAmountSpentAtMerchant: Double = 0
        let numOfTransactionsAtMerchant = groupedTransactions[name]!.count
        
        for i in 0...numOfTransactionsAtMerchant-1 {
            totalAmountSpentAtMerchant += groupedTransactions[name]![i].amount!
        }
        let average = Int(totalAmountSpentAtMerchant) / numOfTransactionsAtMerchant
        
        
        let transactionsNum = LabelWithLabel()
        transactionsNum.title = "Number of transactions"
        transactionsNum.subtitle = " "
        transactionsNum.detail = "\(numOfTransactionsAtMerchant)"
        
        let averageSpend = LabelWithLabel()
        averageSpend.title = "Average spend"
        averageSpend.subtitle = "\(numOfTransactionsAtMerchant) payments"
        averageSpend.formatCurrency(amount: Double(average), currency: currency)
        
        let totalSpent = LabelWithLabel()
        totalSpent.title = "Total spent"
        totalSpent.subtitle = "\(numOfTransactionsAtMerchant) payments"
        totalSpent.formatCurrency(amount: totalAmountSpentAtMerchant, currency: currency)
        
        [transactionsNum, averageSpend, totalSpent].forEach {historyArray.append($0)}
    }
    
    
    fileprivate func setUpTransactionDate() {
       
        guard let date = selectedTransaction?.created else {return}
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let dateRepresentation = dateFormatter.date(from: date) {
        
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "EEEE, d MMM, y, HH:mm"
            displayFormatter.locale = Locale(identifier: "en_GB_POSIX")
            
            self.navigationItem.title = displayFormatter.string(from: dateRepresentation)
        }
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
        return 6
    }
    
    fileprivate func registerCells() {
        collectionView?.register(LabelWithIconCell.self, forCellWithReuseIdentifier: labelWithIconCellID)
        collectionView?.register(LabelWithSwitchCell.self, forCellWithReuseIdentifier: labelWithSwitchCellID)
        collectionView?.register(LabelWithLabelCell.self, forCellWithReuseIdentifier: labelWithLabelCellID)
        collectionView?.register(CentreLabelCell.self, forCellWithReuseIdentifier: centreLabelCellID)
        collectionView?.register(LargeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: largeHeaderCellID)
         collectionView?.register(LabelHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: labelHeaderCellID)
        collectionView?.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: labelFooterCellID)
    }
    
    //MARK: - Creating Cells
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let categoryNotesReceiptCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath) as! LabelWithIconCell
            categoryNotesReceiptCell.labelWithIcon = categoryNotesReceiptArray[indexPath.item]
            
            if indexPath.item == categoryNotesReceiptArray.count - 1 { // i.e. for the last cell
                categoryNotesReceiptCell.separatorView.backgroundColor = .white
            }
            
            return categoryNotesReceiptCell
        }
        if indexPath.section == 1 {
            let shareCostCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath) as! LabelWithIconCell
            shareCostCell.labelWithIcon = shareCostArray[indexPath.item]
            
            if indexPath.item == shareCostArray.count - 1 { // i.e. for the last cell
                shareCostCell.separatorView.backgroundColor = .white
            }
            
            return shareCostCell
        }
        if indexPath.section == 2 {
            let subscriptionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithSwitchCellID, for: indexPath) as! LabelWithSwitchCell
            subscriptionsCell.labelWithSwitch = subscriptionsArray[indexPath.item]
            return subscriptionsCell
        }
        if indexPath.section == 3 {
            let historyCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithLabelCellID, for: indexPath) as! LabelWithLabelCell
            historyCell.labelWithLabel = historyArray[indexPath.item]
           
            if indexPath.item == historyArray.count - 1 { // i.e. for the last cell
                historyCell.separatorView.backgroundColor = .white
            }
            
            return historyCell
        }
        if indexPath.section == 4 {
            let optionCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithSwitchCellID, for: indexPath) as! LabelWithSwitchCell
            optionCell.labelWithSwitch = optionArray[indexPath.item]
            return optionCell
        }
        else {
            let feedbackCell = collectionView.dequeueReusableCell(withReuseIdentifier: centreLabelCellID, for: indexPath) as! CentreLabelCell
            feedbackCell.centreLabel = feedbackArray[indexPath.item]
            
            if indexPath.item == feedbackArray.count - 1 { // i.e. for the last cell
                feedbackCell.separatorView.backgroundColor = .white
            }
            
            return feedbackCell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categoryNotesReceiptArray.count
        }
        if section == 1 {
            return shareCostArray.count
        }
        if section == 2 {
            return subscriptionsArray.count
        }
        if section == 3 {
            return historyArray.count
        }
        if section == 4 {
            return optionArray.count
        }
        else { //section == 5
            return feedbackArray.count
        }
    }
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 60)
        }
        if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 60)
        }
        if indexPath.section == 2 {
            return CGSize(width: view.frame.width, height: 60)
        }
        if indexPath.section == 3 {
            return CGSize(width: view.frame.width, height: 60)
        }
        if indexPath.section == 4 {
            return CGSize(width: view.frame.width, height: 60)
        }
        else { // indexPath.section == 5
            return CGSize(width: view.frame.width, height: 43.5)
        }
    }
    
    //MARK: - Creating Headers and Footers
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            
            if indexPath.section == 0 {
                let transactionInfoHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: largeHeaderCellID, for: indexPath) as! LargeHeaderCell
                transactionInfoHeaderCell.transaction = selectedTransaction
                return transactionInfoHeaderCell
            }
            
            if indexPath.section == 1 {
                let shareCostHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelHeaderCellID, for: indexPath) as! LabelHeaderCell
                shareCostHeader.labelHeader = shareCostHeaderArray[indexPath.item]
                return shareCostHeader
            }
            
            if indexPath.section == 2 {
                let subscriptionsHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelHeaderCellID, for: indexPath) as! LabelHeaderCell
                subscriptionsHeader.labelHeader = subscriptionsHeaderArray[indexPath.item]
                return subscriptionsHeader
            }
            
            if indexPath.section == 3 {
                let historyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelHeaderCellID, for: indexPath) as! LabelHeaderCell
                historyHeader.labelHeader = historyHeaderArray[indexPath.item]
                return historyHeader
            }
            
            if indexPath.section == 4 {
                let optionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelHeaderCellID, for: indexPath) as! LabelHeaderCell
                optionHeader.labelHeader = optionHeaderArray[indexPath.item]
                return optionHeader
            }
                
            else { // indexPath.section == 5
                let feedbackHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelHeaderCellID, for: indexPath) as! LabelHeaderCell
                return feedbackHeader
            }
            
        } else { // It's a footer
            let feedbackFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelFooterCellID, for: indexPath) as! LabelFooterCell
            feedbackFooter.labelFooter = footerContentArray[indexPath.item]
            return feedbackFooter
        }
    }


    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: view.frame.width, height: 210)
        }
        if section == 1 {
            return CGSize(width: view.frame.width, height: 56.5)
        }
        if section == 2 {
            return CGSize(width: view.frame.width, height: 56.5)
        }
        if section == 3 {
            return CGSize(width: view.frame.width, height: 56.5)
        }
        
        if section == 4 {
            return CGSize(width: view.frame.width, height: 56.5)
        } else { // section == 5
            return CGSize(width: view.frame.width, height: 36.5)
        }
    }
    

    //MARK: - Setting size of Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 5 {
            return CGSize(width: view.frame.width, height: 63)
        } else {
            return .zero
        }
    }
    
    //MARK: - Selecting Cells
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("You have clicked on a transactionInfoCell")
        }
        else if indexPath.section == 1 {
            print("You have clicked on a shareCostCell")
        }
    }
}


