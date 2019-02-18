//
//  SetupViewController.swift
//  team2z
//
//  Created by 정인호 on 18/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class SetupViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    let menuLabels: [String] = ["사용가이드", "문의하기", "약관 및 정책", "로그아웃", "버전 1.6.0"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        //        self.myTableView.separatorStyle = .none
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        
        //        let subview = UIView()
        //        view.addSubview(subview)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        let nibName_0 = UINib(nibName: "TableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "SetupTableViewCell")
    }

}


extension SetupViewController: UITableViewDelegate {
    
}
extension SetupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SetupTableViewCell") as! TableViewCell
        
        cell.setupLabel?.text = menuLabels[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(SetupViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func handleTap_0(sender: UITapGestureRecognizer) {
        print("tap0 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
}
