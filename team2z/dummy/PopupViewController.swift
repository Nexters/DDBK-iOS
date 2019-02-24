//
//  PopupViewController.swift
//  team2z
//
//  Created by 정인호 on 25/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

protocol PopupDelegate {
    func movePresentingTabbar()
}

class PopupViewController: UIViewController {
    
    var popupDelegate: PopupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "리뷰쓰기"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeCloseButton())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func makeBackButton() -> UIButton {
        //        let backButtonImage = UIImage(named: "left_arrow.png")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    func makeCloseButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("완료", for: .normal)
        backButton.setTitleColor(UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0), for: .normal)
        backButton.addTarget(self, action: #selector(self.closeButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        navigationController?.dismiss(animated: true, completion: {
            self.popupDelegate?.movePresentingTabbar()
        })
//        navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}
