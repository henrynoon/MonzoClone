//
//  CustomTabBarController.swift
//  MonzoClone
//
//  Created by Henry Noon on 04/12/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.image = UIImage(named: "Home-1")?.withRenderingMode(.alwaysOriginal)
        
        let summaryViewController = SummaryViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let summaryNavController = UINavigationController(rootViewController: summaryViewController)
        summaryNavController.tabBarItem.title = "Summary"
        summaryNavController.tabBarItem.image = UIImage(named: "Summary")?.withRenderingMode(.alwaysOriginal)
        
        viewControllers = [homeNavController, summaryNavController]
    }
}
