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
    let cell3ID = "cell3ID"
    let cell4ID = "cell4ID"
    let cell5ID = "cell5ID"
    let cell6ID = "cell6ID"
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
        category.usefulIcon = "Category Icon"
        
        var notes = LabelWithIcon()
        notes.title = "Add notes and #tags"
        notes.usefulIcon = "Notes Icon"
        
        var receipt = LabelWithIcon()
        receipt.title = "Add receipt"
        receipt.usefulIcon = "Receipt Icon"
        
        return [category, notes, receipt]
    }()
    
    var shareCostHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SHARE THE COST"
        return [header]
    }()
    
    var subscriptionsHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SUBSCRIPTIONS"
        return [header]
    }()

    var historyHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "SAINSBURY'S HISTORY"
        return [header]
    }()
    
    var optionHeaderArray: [LabelHeader] = {
        var header = LabelHeader()
        header.title = "TRANSACTION OPTIONS"
        return [header]
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
    
    //MARK: - Registration
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    fileprivate func setUpCollectionView() {
        collectionView?.register(LabelWithIconCell.self, forCellWithReuseIdentifier: labelWithIconCellID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell3ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell4ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell5ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell6ID)
        
        collectionView?.register(LargeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: largeHeaderCellID)
        
         collectionView?.register(LabelHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: labelHeaderCellID)
        
        collectionView?.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: labelFooterCellID)
    }
    
    //MARK: - Creating cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: cell3ID, for: indexPath)
        let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: cell4ID, for: indexPath)
        let cell5 = collectionView.dequeueReusableCell(withReuseIdentifier: cell5ID, for: indexPath)
        let cell6 = collectionView.dequeueReusableCell(withReuseIdentifier: cell6ID, for: indexPath)
  
        if indexPath.section == 0 {
            let transactionInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath) as! LabelWithIconCell
            transactionInfoCell.labelWithIcon = transactionInfoArray[indexPath.item]
            return transactionInfoCell
        }
        if indexPath.section == 1 {
            let shareCostCell = collectionView.dequeueReusableCell(withReuseIdentifier: labelWithIconCellID, for: indexPath)
            return shareCostCell
        }
        if indexPath.section == 2 {
            cell3.backgroundColor = .yellow
            return cell3
        }
        if indexPath.section == 3 {
            cell4.backgroundColor = .red
            return cell4
        }
        if indexPath.section == 4 {
            cell5.backgroundColor = .purple
            return cell5
        }
        else {
            cell6.backgroundColor = .cyan
            return cell6
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return transactionInfoArray.count
        }
        if section == 1 {
            return 2
        }
        if section == 2 {
            return 1
        }
        if section == 3 {
            return 3
        }
        if section == 4 {
            return 1
        }
        else { //section == 5
            return 2
        }
    }
    
    //MARK: - Setting size of Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 50)
        }
        if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 50)
        }
        if indexPath.section == 2 {
            return CGSize(width: view.frame.width, height: 50)
        }
        if indexPath.section == 3 {
            return CGSize(width: view.frame.width, height: 50)
        }
        if indexPath.section == 4 {
            return CGSize(width: view.frame.width, height: 50)
        }
        else { // indexPath.section == 5
            return CGSize(width: view.frame.width, height: 50)
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
            return CGSize(width: view.frame.width, height: 50)
        }
        if section == 2 {
            return CGSize(width: view.frame.width, height: 50)
        }
        if section == 3 {
            return CGSize(width: view.frame.width, height: 50)
        }
        
        if section == 4 {
            return CGSize(width: view.frame.width, height: 50)
        } else { // section == 5
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    

    //MARK: - Setting size of Footers
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 5 {
            return CGSize(width: view.frame.width, height: 50)
        } else {
            return .zero
        }
    }
}


