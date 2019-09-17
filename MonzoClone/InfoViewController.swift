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
    let cell2ID = "cell2ID"
    let cell3ID = "cell3ID"
    let cell4ID = "cell4ID"
    let cell5ID = "cell5ID"
    let cell6ID = "cell6ID"
    
    let paymentInfoHeaderCellID = "paymentInfoHeaderCellID"
    let reuseSectionHeaderCellID = "reuseSectionHeaderCellID"
    
    let footerID = "footerID"
    
    var paymentInfoHeaderArray: [PaymentInfoHeader] = {
       //getMonzoData()...which I'll do later
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

    fileprivate func getMonzoData() {
        //I'll update this later to pull the info from Monzo..just using example data for now
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMonzoData()
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
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell2ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell3ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell4ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell5ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell6ID)
        
        collectionView?.register(PaymentInfoHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: paymentInfoHeaderCellID)
        
         collectionView?.register(ReuseSectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseSectionHeaderCellID)
        
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    //setting number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    //creating cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: cell2ID, for: indexPath)
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
            cell2.backgroundColor = .green
            return cell2
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
                let subscriptionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath)
                subscriptionHeader.backgroundColor = UIColor(red: 0.9569, green: 0.9176, blue: 0.4588, alpha: 1.0)
                return subscriptionHeader
            }
            if indexPath.section == 3 {
                let historyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath)
                historyHeader.backgroundColor = UIColor(red: 0.949, green: 0.4863, blue: 0.4549, alpha: 1.0)
                return historyHeader
            }
            if indexPath.section == 4 {
                let optionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath)
                optionHeader.backgroundColor = UIColor(red: 0.8667, green: 0.4314, blue: 0.898, alpha: 1.0)
                return optionHeader
            }
            else { //for indexPath.section == 5
                let feedbackHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseSectionHeaderCellID, for: indexPath)
                feedbackHeader.backgroundColor = UIColor(red: 0.3765, green: 0.6941, blue: 0.7569, alpha: 1.0)
                return feedbackHeader
            }
        } else { //if kind == UICollectionView.elementKindSectionHeader
            let feedbackFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            feedbackFooter.backgroundColor = .black
            return feedbackFooter
        }
        
        //NB - I might simplify with a 'switch' statement
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


