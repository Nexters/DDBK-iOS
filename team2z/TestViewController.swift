//
//  TestViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.green
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        self.view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
