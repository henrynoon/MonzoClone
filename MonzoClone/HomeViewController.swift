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
    
    var transactionsArrayTwo = [Transaction]() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMonzoData()
        setUpCollectionView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK - Importing Monzo JSON Data
    
    fileprivate func getMonzoData() {
        
        guard let path = Bundle.main.path(forResource: "MonzoData", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            
            let json = try JSON(data: data)
            updateTransactionModel(with: json)
            
        } catch {
            print(error)
        }
    }
    
    fileprivate func updateTransactionModel(with json: JSON) {
        
        let createdArray = json["transactions"].arrayValue.map {$0["created"].stringValue}
        
        let descriptionArray = json["transactions"].arrayValue.map {$0["description"].stringValue}
        
        let amountArray = json["transactions"].arrayValue.map {$0["amount"].intValue}
        
        let nameArray = json["transactions"].arrayValue.map {$0["merchant"]["name"].stringValue}
        
        let logoArray = json["transactions"].arrayValue.map {$0["merchant"]["logo"].stringValue}
        
        let notesArray = json["transactions"].arrayValue.map {$0["notes"].stringValue}
        
        let categoryArray = json["transactions"].arrayValue.map {$0["category"].stringValue}
        
        let addressArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["short_formatted"].stringValue}
        
        let latitudeArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["latitude"].doubleValue}
        
        let longitudeArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["longitude"].doubleValue}
        
        
        for index in 0...createdArray.count-1 {
            let transactionObj = Transaction()
            
            transactionObj.created = createdArray[index]
            transactionObj.transactionDescription = descriptionArray[index]
            transactionObj.amount = amountArray[index]
            transactionObj.merchant?.name = nameArray[index]
            transactionObj.merchant?.logo = logoArray[index]
            transactionObj.notes = notesArray[index]
            transactionObj.category = categoryArray[index]

            let merchantObj = Merchant()
            transactionObj.merchant = merchantObj
            
            let addressObj = Address()
            merchantObj.address = addressObj
            
            addressObj.short_formatted = addressArray[index]
            addressObj.latitude = latitudeArray[index]
            addressObj.longitude = longitudeArray[index]
           
            transactionsArrayTwo.append(transactionObj)
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

