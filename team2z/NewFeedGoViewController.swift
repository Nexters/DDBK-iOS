//
//  NewFeedGoViewController.swift
//  team2z
//
//  Created by MOONJUNG on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class NewFeedGoViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let NewFeedView: NewFeedViewController = NewFeedViewController()
        self.present(NewFeedView, animated: true, completion: nil)
    }


}
