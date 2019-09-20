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
    
    let labelWithIconCellID = "labelWithIconCellID"
    let labelWithSwitchCellID = "labelWithSwitchCellID"
    let labelWithLabelCellID = "labelWithLabelCellID"
    let centreLabelCellID = "centreLabelCellID"
    let largeHeaderCellID = "largeHeaderCellID"
    let labelHeaderCellID = "labelHeaderCellID"
    let labelFooterCellID = "labelFooterCellID"
    
    var transactionInfoHeaderArray: [LargeHeader] = {
        var shop = LargeHeader()
        shop.amount = "£5.45"
        shop.created = "2019-03-15T20:26:18Z"
        shop.address = "8-12 Worple Rd, Wimbledon"
        shop.city = "London"
        shop.country = "GB"
        shop.latitude = 51.420713
        shop.longitude = -0.209699
        shop.postcode = "SW19 4DD"
        shop.region = "Greater London"
        shop.logo = "Sainsbury's Logo"
        shop.name = "Sainsbury's"
        return [shop]
    }()

    var transactionInfoArray: [LabelWithIcon] = {
        var category = LabelWithIcon()
        category.title = "Groceries"
        category.icon = "Category Icon"
        
        var notes = LabelWithIcon()
        notes.title = "Add notes and #tags"
        notes.icon = "Notes Icon"
        
        var receipt = LabelWithIcon()
        receipt.title = "Add receipt"
        receipt.icon = "Receipt Icon"
        
        return [category, notes, receipt]
    }()
    
    var shareCostHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SHARE THE COST"
        return [header]
    }()
    
    var shareCostArray: [LabelWithIcon] = {
        var sharedTab = LabelWithIcon()
        sharedTab.title = "Add to Shared Tab"
        sharedTab.subtitle = "A simple way to manage shared expenses"
        sharedTab.icon = "Tab Icon"
        
        var splitBill = LabelWithIcon()
        splitBill.icon = "Bill Icon"
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

    var historyHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SAINSBURY'S HISTORY"
        return [header]
    }()
    
    var historyArray: [LabelWithLabel] = {
        var transactionsNum = LabelWithLabel()
        transactionsNum.title = "Number of transactions"
        transactionsNum.detail = "143"
        
        var averageSpend = LabelWithLabel()
        averageSpend.title = "Average spend"
        averageSpend.subtitle = "143 payments"
        averageSpend.detail = "£7.93"
        
        var totalSpent = LabelWithLabel()
        totalSpent.title = "Total spent"
        totalSpent.subtitle = "143 payments"
        totalSpent.detail = "£1,134.38"
        
        return [transactionsNum, averageSpend, totalSpent]
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
    
    var footerArray: [LabelFooter] = {
        let foot = LabelFooter()
        foot.title = "SAINSBURYS SACAT 0016 WIMBLEDON GBR"
        return [foot]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        setUpCollectionView()
        setUpCollectionViewLayout()
    }
    
    fileprivate func setUpCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0.5
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    //MARK: - Registration
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    fileprivate func setUpCollectionView() {
        collectionView?.register(LabelWithIconCell.self, forCellWithReuseIdentifier: labelWithIconCellID)
        collectionView?.register(LabelWithSwitchCell.self, forCellWithReuseIdentifier: labelWithSwitchCellID)
        collectionView?.register(LabelWithLabelCell.self, forCellWithReuseIdentifier: labelWithLabelCellID)
        collectionView?.register(CentreLabelCell.self, forCellWithReuseIdentifier: centreLabelCellID)
        collectionView?.register(LargeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: largeHeaderCellID)
         collectionView?.register(LabelHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: labelHeaderCellID)
        collectionView?.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: labelFooterCellID)
    }
    
    //MARK: - Creating cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let transactionInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath) as! LabelWithIconCell
            transactionInfoCell.labelWithIcon = transactionInfoArray[indexPath.item]
            return transactionInfoCell
        }
        if indexPath.section == 1 {
            let shareCostCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath) as! LabelWithIconCell
            shareCostCell.labelWithIcon = shareCostArray[indexPath.item]
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
            return feedbackCell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return transactionInfoArray.count
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
    
    //MARK: - Creating Headers
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            
            if indexPath.section == 0 {
                let transactionInfoHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: largeHeaderCellID, for: indexPath) as! LargeHeaderCell
                transactionInfoHeaderCell.largeHeader = transactionInfoHeaderArray[indexPath.item]
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
            
        } else { //It's a footer
            let feedbackFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelFooterCellID, for: indexPath) as! LabelFooterCell
            feedbackFooter.labelFooter = footerArray[indexPath.item]
            return feedbackFooter
        }
    }


    //MARK: - Setting size of Headers
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: view.frame.width, height: 250)
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


