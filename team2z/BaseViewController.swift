//
//  BaseViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 15..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
//    let baseTabBar = UITabBarController()
    lazy var baseTabBar = {
        BaseTabBarController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
    }
    
    private func createTabBarController() {
        baseTabBar.tabBar.tintColor = UIColor.black
        baseTabBar.tabBar.barTintColor = UIColor.white
        baseTabBar.tabBar.isTranslucent = false
        
        let HomeVC = HomeViewController()
        let DiscoveryVC = DiscoveryViewController()
        let NewFeedVC = NewFeedGoViewController()
        let MapVC = MapViewController()
        let MyPageVC = MyPageViewController()
        
        HomeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        DiscoveryVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        NewFeedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        MapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        MyPageVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
 
        let controllerArray = [HomeVC, DiscoveryVC, NewFeedVC, MapVC, MyPageVC]
        baseTabBar.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0) }
        
        self.view.addSubview(baseTabBar.view)
    }
}
