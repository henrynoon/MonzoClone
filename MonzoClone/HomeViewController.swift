//
//  HomeViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 23/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let transactionCellID = "transactionCellID"
    let topHeaderID = "topHeaderID"
    let transactionHeaderID = "transactionHeaderID"
    
    var transactionsArray: [Transaction] = {
        //Sample data...I will get the data later from Monzo
        var transaction1 = Transaction()
        transaction1.logo = "Sainsbury's Logo"
        transaction1.title = "Sainsbury's"
        transaction1.subtitle = "I bought some groceries"
        transaction1.price = "£5.45"
        
        
        var transaction2 = Transaction()
        transaction2.logo = "Coop Logo"
        transaction2.title = "Coop"
        transaction2.subtitle = "I bought some bread"
        transaction2.price = "£1.00"
        
        return [transaction1, transaction2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    //MARK: - Registration
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    fileprivate func setUpCollectionView() {
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: transactionCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: topHeaderID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: transactionHeaderID)
    }
    
    
    //MARK: - Creating Cells
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let transactionCell = collectionView.dequeueReusableCell(withReuseIdentifier: transactionCellID, for: indexPath) as! TransactionCell
        transactionCell.transaction = transactionsArray[indexPath.item]
        return transactionCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return transactionsArray.count
        }
    }
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 60)
    }
    
    //MARK: - Creating Headers
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let topHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: topHeaderID, for: indexPath)
            topHeader.backgroundColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
            return topHeader
        } else {
            let transactionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: transactionHeaderID, for: indexPath)
            transactionHeader.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
            return transactionHeader
        }
    }
    
    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 90)
        }
        else {
            return CGSize(width: view.frame.width, height: 30)
        }
    }
}

