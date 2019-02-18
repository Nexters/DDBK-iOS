//
//  GradeViewController.swift
//  team2z
//
//  Created by 정인호 on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class GradeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "매니아 등급"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.tabBarController?.tabBar.isHidden = true
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = false
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
