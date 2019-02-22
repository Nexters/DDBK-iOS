//
//  SearchResultViewController.swift
//  team2z
//
//  Created by 정인호 on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    var searchKeyword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if searchKeyword != nil, (searchKeyword?.count)! > 0{
            self.title = "\'\(searchKeyword!)\'의 검색 결과"
        } else {
            self.title = "검색결과"
        }
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeSaveButton())
    }

    func makeBackButton() -> UIButton {
        //        let backButtonImage = UIImage(named: "left_arrow.png")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    func makeSaveButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "clear_cell_icon"), for: .normal)
        backButton.addTarget(self, action: #selector(self.saveButtonPressed), for: .touchUpInside)
        return backButton
    }

    @objc func backButtonPressed() {
        //        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        
    }
}
