//
//  HomeViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 23/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    //MARK: - Registration
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    fileprivate func setUpCollectionView() {
        //register cells
    }
    
    
    //MARK: - Creating Cells
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    //MARK: - Setting size of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
    
    //MARK: - Creating Headers
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        <#code#>
    }
    
    //MARK: - Setting size of Headers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        <#code#>
    }
    
    //MARK: - Setting size of Footers
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        <#code#>
    }
    
    
    
    
}

