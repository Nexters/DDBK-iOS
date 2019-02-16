//
//  TestOneViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 15..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import Foundation
import UIKit

class TestOneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "One"
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        self.view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
  
}
