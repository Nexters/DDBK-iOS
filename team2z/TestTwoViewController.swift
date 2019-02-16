//
//  TestTwoViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 15..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import Foundation
import UIKit

class TestTwoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Two"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
}
