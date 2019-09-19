//
//  InfoViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 04/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class InfoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let paymentInfoCellID = "paymentInfoCellID"
    let shareCostCellID = "shareCostCellID"
    let cell3ID = "cell3ID"
    let cell4ID = "cell4ID"
    let cell5ID = "cell5ID"
    let cell6ID = "cell6ID"
    
    let paymentInfoHeaderCellID = "paymentInfoHeaderCellID"
    let reuseSectionHeaderCellID = "reuseSectionHeaderCellID"
    
    let labelFooterCellID = "labelFooterCellID"
    
    var paymentInfoHeaderArray: [PaymentInfoHeader] = {
        var shop = PaymentInfoHeader()
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

    var paymentInfoArray: [PaymentInfo] = {
        var category = PaymentInfo()
        category.title = "Groceries"
        category.usefulIcon = "Category Icon"
        
        var notes = PaymentInfo()
        notes.title = "Add notes and #tags"
        notes.usefulIcon = "Notes Icon"
        
        var receipt = PaymentInfo()
        receipt.title = "Add receipt"
        receipt.usefulIcon = "Receipt Icon"
        
        return [category, notes, receipt]
    }()
    
    var shareCostHeaderArray: [ReuseSectionHeader] = {
        var header = ReuseSectionHeader()
        header.title = "SHARE THE COST"
        return [header]
    }()
    
    var subscriptionsHeaderArray: [ReuseSectionHeader] = {
        var header = ReuseSectionHeader()
        header.title = "SUBSCRIPTIONS"
        return [header]
    }()

    var historyHeaderArray: [ReuseSectionHeader] = {
        var header = ReuseSectionHeader()
        header.title = "SAINSBURY'S HISTORY"
        return [header]
    }()
    
    var optionHeaderArray: [ReuseSectionHeader] = {
        var header = ReuseSectionHeader()
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
    
    //registering the cells, headers, footers
    fileprivate func setUpCollectionView() {
        collectionView?.register(PaymentInfoCell.self, forCellWithReuseIdentifier: paymentInfoCellID)
        collectionView?.register(ShareCostCell.self, forCellWithReuseIdentifier: shareCostCellID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell3ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell4ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell5ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell6ID)
        
        collectionView?.register(PaymentInfoHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: paymentInfoHeaderCellID)
        
         collectionView?.register(ReuseSectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseSectionHeaderCellID)
        
        collectionView?.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: labelFooterCellID)
    }
    
    //setting number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    //creating cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: cell3ID, for: indexPath)
        let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: cell4ID, for: indexPath)
        let cell5 = collectionView.dequeueReusableCell(withReuseIdentifier: cell5ID, for: indexPath)
        let cell6 = collectionView.dequeueReusableCell(withReuseIdentifier: cell6ID, for: indexPath)
  
        if indexPath.section == 0 {
            let paymentInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: paymentInfoCellID, for: indexPath) as! PaymentInfoCell
            paymentInfoCell.paymentInfo = paymentInfoArray[indexPath.item]
            return paymentInfoCell
        }
        if indexPath.section == 1 {
            let shareCostCell = collectionView.dequeueReusableCell(withReuseIdentifier: shareCostCellID, for: indexPath)
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
            return paymentInfoArray.count
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
        else {
            return 2
        }
    }
    
    //setting size of cells
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
        else { //for indexPath.section ==5
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    
    //create the header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            
            if indexPath.section == 0 {
                let paymentInfoHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: paymentInfoHeaderCellID, for: indexPath) as! PaymentInfoHeaderCell
                paymentInfoHeaderCell.paymentInfoHeader = paymentInfoHeaderArray[indexPath.item]
                return paymentInfoHeaderCell
            }
            
            if indexPath.section == 1 {
                let shareCostHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath) as! ReuseSectionHeaderCell
                shareCostHeader.reuseSectionHeader = shareCostHeaderArray[indexPath.item]
                return shareCostHeader
            }
            
            if indexPath.section == 2 {
                let subscriptionsHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath) as! ReuseSectionHeaderCell
                subscriptionsHeader.reuseSectionHeader = subscriptionsHeaderArray[indexPath.item]
                return subscriptionsHeader
            }
            
            if indexPath.section == 3 {
                let historyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath) as! ReuseSectionHeaderCell
                historyHeader.reuseSectionHeader = historyHeaderArray[indexPath.item]
                return historyHeader
            }
            
            if indexPath.section == 4 {
                let optionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath) as! ReuseSectionHeaderCell
                optionHeader.reuseSectionHeader = optionHeaderArray[indexPath.item]
                return optionHeader
            }
                
            else { //for indexPath.section == 5
                let feedbackHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath) as! ReuseSectionHeaderCell
                return feedbackHeader
            }
            
        } else { //It's a footer
            let feedbackFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: labelFooterCellID, for: indexPath) as! LabelFooterCell
            feedbackFooter.footer = footerArray[indexPath.item]
            return feedbackFooter
        }
    }


    //setting size of header
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
        } else { // this is for section == 5
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    

    //setting size of footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            return .zero
        }
        if section == 1 {
            return .zero
        }
        if section == 2 {
            return .zero
        }
        if section == 3 {
            return .zero
        }
        if section == 4 {
            return .zero
            
        } else { //for section == 5
            return CGSize(width: view.frame.width, height: 50)
        }
    }
}


