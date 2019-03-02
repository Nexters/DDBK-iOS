//
//  BaseTabBarController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    var presentingTabbarIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(tabBar)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelect..\(tabBarController.selectedIndex)")
  
        
       /* if tabBarController.selectedIndex == 2 {
            let storyboard = UIStoryboard(name: "Popup", bundle: nil)
            let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
            let nav = UINavigationController(rootViewController: popupViewController)
//            present(nav, animated: true, completion: nil)
            tabBarController.present(nav, animated: true, completion: nil)
        }else{
            return
        }*/
        
        
//        tabBarController.selectedIndex = presentingTabbarIndex!
        
        return
        
//        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
//        let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
//        tabBarController.present(popupViewController, animated: true, completion: nil)

        /*
        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
        let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
//        popupViewController.popupDelegate = self
//        popupViewController.modalPresentationStyle = .overFullScreen
        let nav = UINavigationController(rootViewController: popupViewController)
        tabBarController.present(nav, animated: true, completion: nil)
        */
     
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("should..\(tabBarController.selectedIndex)")
        
//        if viewController is PopupViewController {
//            print("?????")
//            if let newVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") {
//
//                newVC.modalPresentationStyle = .overFullScreen
//                let nav = UINavigationController(rootViewController: newVC)
//
//                tabBarController.present(nav, animated: true)
//                return false
//            }
//        }
        
        presentingTabbarIndex = tabBarController.selectedIndex
        return true
        
//        guard viewController is PopupViewController else { return true }
//        let storyboard = UIStoryboard(name: "Popup", bundle: nil)
//        let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
//        popupViewController.modalPresentationStyle = .overFullScreen
//        tabBarController.present(popupViewController, animated: true, completion: nil)
//        return false
//
//        if let identifier = viewController.restorationIdentifier, identifier == "newfeed" {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "newfeed") as! NewFeedRealViewController
//            present(vc, animated: true, completion: nil)
//            return false
//        }
//        return true
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
////        NewFeedViewController view: NewFeedViewController
//        if tabBarController.selectedIndex == 2 {
//            self.present(NewFeedViewController(), animated: true, completion: nil)
//        }
//    }
}

/*
 이거지움
extension BaseTabBarController: PopupDelegate {
    func movePresentingTavarr() {
        
    }
    
    func movePresentingTabbar() {
        
    }
}
*/
