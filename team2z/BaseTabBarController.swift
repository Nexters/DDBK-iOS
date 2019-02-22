//
//  BaseTabBarController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(tabBar)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let identifier = viewController.restorationIdentifier, identifier == "newfeed" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "newfeed") as! NewFeedRealViewController
            present(vc, animated: true, completion: nil)
            return false
        }
        return true
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
////        NewFeedViewController view: NewFeedViewController
//        if tabBarController.selectedIndex == 2 {
//            self.present(NewFeedViewController(), animated: true, completion: nil)
//        }
//    }
}
