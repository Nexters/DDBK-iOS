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
    let tabBarIcon = ["tab_icon01", "tab_icon02", "tab_icon03", "tab_icon04", "tab_icon05"]
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
//        let NewFeedVC = NewFeedRealViewController()
        
//        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
//        let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        
//        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
//        let NewFeedVC = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
//
        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
        let NewFeedVC = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        let MapVC = MapViewController()
        let MyPageVC = MyPageViewController()
 
        let controllerArray = [HomeVC, DiscoveryVC, NewFeedVC, MapVC, MyPageVC]
        baseTabBar.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0) }

        
        var tabBarIndex = 0
        for tabBarItem in baseTabBar.tabBar.items! {
            tabBarItem.tag = tabBarIndex
            tabBarItem.title = ""
            tabBarItem.image = UIImage(named: tabBarIcon[tabBarIndex])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: tabBarIcon[tabBarIndex] + "_active")?.withRenderingMode(.alwaysOriginal)
            tabBarIndex += 1
        }
         
        self.view.addSubview(baseTabBar.view)
    }
}
