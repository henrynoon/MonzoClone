//
//  InfoViewController.swift
//  MonzoClone
//
//  Created by Henry Noon on 04/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class InfoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cell1ID = "cell1ID"
    let cell2ID = "cell2ID"
    let cell3ID = "cell3ID"
    let cell4ID = "cell4ID"
    let cell5ID = "cell5ID"
    let cell6ID = "cell6ID"
    let header1ID = "header1ID"
    let header2ID = "header2ID"
    let header3ID = "header3ID"
    let header4ID = "header4ID"
    let header5ID = "header5ID"
    let header6ID = "header6ID"
    let footerID = "footerID"

    
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
        collectionView?.register(SectionZeroCell.self, forCellWithReuseIdentifier: cell1ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell2ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell3ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell4ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell5ID)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cell6ID)
        
        collectionView?.register(Header1Cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header1ID)
         collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header2ID)
         collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header3ID)
         collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header4ID)
         collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header5ID)
         collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header6ID)
        
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    
    //setting number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    //creating cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: cell1ID, for: indexPath)
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: cell2ID, for: indexPath)
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: cell3ID, for: indexPath)
        let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: cell4ID, for: indexPath)
        let cell5 = collectionView.dequeueReusableCell(withReuseIdentifier: cell5ID, for: indexPath)
        let cell6 = collectionView.dequeueReusableCell(withReuseIdentifier: cell6ID, for: indexPath)
  
        if indexPath.section == 0 {
            return cell1
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
            return 3
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
                let header1 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header1ID, for: indexPath)
                return header1
            }
            if indexPath.section == 1 {
                let header2 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header2ID, for: indexPath)
                header2.backgroundColor = UIColor(red: 0.5059, green: 0.9373, blue: 0.451, alpha: 1.0)
                return header2
            }
            if indexPath.section == 2 {
                let header3 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header3ID, for: indexPath)
                header3.backgroundColor = UIColor(red: 0.9569, green: 0.9176, blue: 0.4588, alpha: 1.0)
                return header3
            }
            if indexPath.section == 3 {
                let header4 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header4ID, for: indexPath)
                header4.backgroundColor = UIColor(red: 0.949, green: 0.4863, blue: 0.4549, alpha: 1.0)
                return header4
            }
            if indexPath.section == 4 {
                let header5 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header5ID, for: indexPath)
                header5.backgroundColor = UIColor(red: 0.8667, green: 0.4314, blue: 0.898, alpha: 1.0)
                return header5
            }
            else { //for indexPath.section == 5
                let header6 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: header6ID, for: indexPath)
                header6.backgroundColor = UIColor(red: 0.3765, green: 0.6941, blue: 0.7569, alpha: 1.0)
                return header6
            }
        } else { //if kind == UICollectionView.elementKindSectionHeader
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            footer.backgroundColor = .black
            return footer
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


