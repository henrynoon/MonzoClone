//
//  CategoryTransactionsViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 26/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class CategoryTransactionsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let transactionCellID = "transactionCellID"
    let transactionHeaderID = "transactionHeaderID"
    var footerID = "footerID"
    let headerView = CategorySummaryHeaderView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: StickyFlowLayout())
    var selectedCategory: Category? {
        didSet {
            groupTransactionsByDate()
        }
    }
    var transactionsGroupedByDate = [[Transaction]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        registerCollectionViewCells()
    }
    
    //MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    
    //MARK:- Set-up
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return transactionsGroupedByDate.count
    }
    
    
    fileprivate func registerCollectionViewCells() {
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: transactionCellID)
        collectionView.register(TransactionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: transactionHeaderID)
        collectionView.register(LabelFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    fileprivate func setUpViewController() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor , leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: 130))
        collectionView.anchor(top: headerView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
    }
    
    fileprivate func groupTransactionsByDate() {
        
        guard let transactionArray = selectedCategory?.transactions else {return}
        
        let groupedTransactions = Dictionary(grouping: transactionArray) { (element) -> String.SubSequence in
            return element.created![..<10] //Just looking at substrings 0 to 9
        }
        
        groupedTransactions.keys.sorted(by: >).forEach { (key) in
            let values = groupedTransactions[key] // ie all objects that have that specific 'created' key
            transactionsGroupedByDate.append(values ?? [])
        }
    }
    
    //MARK: - Creating Cells
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let transactionCell = collectionView.dequeueReusableCell(withReuseIdentifier: transactionCellID, for: indexPath) as! TransactionCell
        transactionCell.transaction = transactionsGroupedByDate[indexPath.section][indexPath.row]
        
        if indexPath.item == transactionsGroupedByDate[indexPath.section].count - 1 {
            transactionCell.separatorView.backgroundColor = .white
        }
        
        return transactionCell
    }
    
    
    //MARK: - Setting size of Cells
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    //MARK: - Creating Headers and Footers
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let transactionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: transactionHeaderID, for: indexPath) as! TransactionHeaderCell
            
            transactionHeader.transaction = transactionsGroupedByDate[indexPath.section][indexPath.row]
            
            return transactionHeader
            
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! LabelFooterCell
            
            return footer
        }
    }
    
    //MARK: - Setting size of Headers and Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == transactionsGroupedByDate.count-1 {
            
            let sss = transactionsGroupedByDate[section].count
            
            print("THE sss IS.....\(sss)")
            
            return CGSize(width: view.frame.width, height: view.frame.height)
        } else {
            return .zero
        }
    }
    
    
    //MARK: - Segue
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let transactionAtIndex = transactionsGroupedByDate[indexPath.section][indexPath.row]
        
        let transactionVC = TransactionViewController(collectionViewLayout: StretchyFlowLayout())
        
        transactionVC.selectedTransaction = transactionAtIndex
        
        guard let upgroupedTransactions = selectedCategory?.transactions else {return}
        
        transactionVC.allTransactions = upgroupedTransactions
        
        self.navigationController?.pushViewController(transactionVC, animated: true)
    }
}
