//
//  HomeViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 23/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit
import SwiftyJSON

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
        getMonzoData()
        setUpCollectionView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK - Importing Monzo JSON Data
    
    func getMonzoData() {
        //N.B. For now, I have put a sample of some Monzo data into a JSON file. I will deserialise it here and use it to populate the rest of the app. After that, I'll change this method so you can get your own data from your Monzo account
        
        guard let path = Bundle.main.path(forResource: "MonzoData", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            
            let json = try JSON(data: data)
            print(json)
            
        } catch {
            print(error)
        }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    //MARK: - Registration
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    fileprivate func setUpCollectionView() {
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: transactionCellID)
        collectionView.register(TopHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: topHeaderID)
        collectionView.register(TransactionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: transactionHeaderID)
    }
    
    
    //MARK: - Creating Cells
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let transactionCell = collectionView.dequeueReusableCell(withReuseIdentifier: transactionCellID, for: indexPath) as! TransactionCell
        transactionCell.transaction = transactionsArray[indexPath.item]
        
        if indexPath.item == transactionsArray.count - 1 {
            transactionCell.separatorView.backgroundColor = .white
        }
        
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
            let topHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: topHeaderID, for: indexPath) as! TopHeaderCell
            return topHeader
        } else {
            let transactionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: transactionHeaderID, for: indexPath) as! TransactionHeaderCell
            return transactionHeader
        }
    }
    
    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 90)
        }
        else {
            return CGSize(width: view.frame.width, height: 45)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let transactionVC = TransactionViewController(collectionViewLayout: HeaderFlowLayout())
        
        self.navigationController?.pushViewController(transactionVC, animated: true)
    }
}

