//
//  CategoryTransactionsViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 26/02/2020.
//  Copyright © 2020 Henry Noon. All rights reserved.
//

import UIKit

class CategoryTransactionsViewController: UIViewController  {
    
    //MARK:- Set-up
    //MARK: - Layout
    //MARK: - Creating Cells
    //MARK: - Setting size of Cells
    //MARK: - Creating Headers and Footers
    //MARK: - Setting size of Headers and Footers
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    
    let headerView = CategorySummaryHeaderView()
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: StickyFlowLayout())
    
    
    fileprivate func setUpViewController() {
        view.addSubview(headerView)
        headerView.fillSuperview()
    }
    
    /*
     
     cellIDs
     register cell IDs
     
     
     numberOfSectionsIN
     cellForitemAt
     numberofitemsinsection
     viewforsupplementaryelementofkind
     referencesizeofheaderinsection
     referencesizeforfooterinsection
     
     
     
     */
    
}
