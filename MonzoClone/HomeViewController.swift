//
//  HomeViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 23/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let transactionCellID = "transactionCellID"
    let topHeaderID = "topHeaderID"
    let transactionHeaderID = "transactionHeaderID"
    var footerID = "footerID"
    let topView = TopHeaderCell()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: StickyHeaderFlowLayout())
    var oneDTransactionArray = [Transaction]()
    var transactionsArray = [[Transaction]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMonzoData()
        setUpViewController()
        registerCollectionViewCells()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Importing and Configuring Monzo JSON Data
    
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
        
        let amountArray = json["transactions"].arrayValue.map {$0["amount"].doubleValue}
        
        let currencyArray = json["transactions"].arrayValue.map {$0["currency"].stringValue}
        
        let nameArray = json["transactions"].arrayValue.map {$0["merchant"]["name"].stringValue}
        
        let logoArray = json["transactions"].arrayValue.map {$0["merchant"]["logo"].stringValue}
        
        let notesArray = json["transactions"].arrayValue.map {$0["notes"].stringValue}
        
        let categoryArray = json["transactions"].arrayValue.map {$0["merchant"]["category"].stringValue}
        
        let addressArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["short_formatted"].stringValue}
        
        let latitudeArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["latitude"].doubleValue}
        
        let longitudeArray = json["transactions"].arrayValue.map {$0["merchant"]["address"]["longitude"].doubleValue}
        
        for index in 0...createdArray.count-1 {
            let transactionObj = Transaction()
            
            transactionObj.created = createdArray[index]
            transactionObj.transactionDescription = descriptionArray[index]
            transactionObj.amount = amountArray[index]
            transactionObj.currency = currencyArray[index]
            transactionObj.notes = notesArray[index]
          
            let merchantObj = Merchant()
            transactionObj.merchant = merchantObj
            merchantObj.name = nameArray[index]
            merchantObj.logo = logoArray[index]
            merchantObj.category = categoryArray[index]
            
            let addressObj = Address()
            merchantObj.address = addressObj
            
            addressObj.short_formatted = addressArray[index]
            addressObj.latitude = latitudeArray[index]
            addressObj.longitude = longitudeArray[index]
           
            oneDTransactionArray.append(transactionObj)
        }
        groupTransactions()
    }
    
    fileprivate func groupTransactions() {
        
        let groupedTransactions = Dictionary(grouping: oneDTransactionArray.reversed()) { (element) -> String.SubSequence in
            return element.created![..<10] //Just looking at substrings 0 to 9
        }
        
        groupedTransactions.keys.sorted(by: >).forEach { (key) in
            print(key)
            let values = groupedTransactions[key] // ie all objects that have that specific 'created' key
            transactionsArray.append(values ?? [])
        }
    }

    //MARK: - Layout
    
    fileprivate func setUpViewController() {
        view.addSubview(topView)
        view.addSubview(collectionView)
        topView.anchor(top: view.topAnchor , leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: 130))
        
        collectionView.anchor(top: topView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    //MARK: - Registration
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return transactionsArray.count
    }
    
    fileprivate func registerCollectionViewCells() {
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: transactionCellID)
        collectionView.register(TopHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: topHeaderID)
        collectionView.register(TransactionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: transactionHeaderID)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    
    //MARK: - Creating Cells
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let transactionCell = collectionView.dequeueReusableCell(withReuseIdentifier: transactionCellID, for: indexPath) as! TransactionCell
        transactionCell.transaction = transactionsArray[indexPath.section][indexPath.row]
        
        if indexPath.item == transactionsArray.count - 1 {
            transactionCell.separatorView.backgroundColor = .white
        }
        return transactionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return transactionsArray[section].count
    }
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 60)
    }
    
    //MARK: - Creating Headers
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let transactionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: transactionHeaderID, for: indexPath) as! TransactionHeaderCell
            
            transactionHeader.transaction = transactionsArray[indexPath.section][indexPath.row]
            
            return transactionHeader
            
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            
            footer.backgroundColor = .green
            
            return footer
        }
    }
    
    //MARK: - Setting size of Headers and Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
            return CGSize(width: view.frame.width, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == transactionsArray.count-1 {
            return CGSize(width: view.frame.width, height: 100)
        } else {
            return .zero
        }
    }
    
    //MARK: - Segue
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let transactionAtIndex = transactionsArray[indexPath.section][indexPath.row]
        
        let transactionVC = TransactionViewController(collectionViewLayout: StretchyHeaderFlowLayout())
        
        transactionVC.selectedTransaction = transactionAtIndex
        
        self.navigationController?.pushViewController(transactionVC, animated: true)
    }
}

