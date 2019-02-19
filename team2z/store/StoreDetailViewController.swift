//
//  StoreDetailViewController.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class StoreDetailViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.backgroundColor = .white
        // White color Background + Red Color Title
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        //        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        // 테이블 뷰 border 없애기
//        self.myTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.size.width, height: 1))
        
        let nibName_0 = UINib(nibName: "StoreCommonTableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "StoreCommonCell")
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
    
    @objc func backButtonPressed() {
        //        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
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

extension StoreDetailViewController: UITableViewDelegate {
    
}
extension StoreDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCommonCell") as! StoreCommonTableViewCell
        cell.StoreFooterUIView.ratingLabel?.text = "2.8"
        cell.StoreFooterUIView.cosmosView.rating = 2.8
        cell.nameLabel.textColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
        cell.nameLabel.font = cell.nameLabel.font.withSize(22)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return " "
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNormalMagnitude
        default:
            return 35.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Create Button with title "Popular".
        let b1 = UIButton()
        b1.setTitle("왔다갔어요", for: .normal)
        b1.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(95), height: CGFloat(35))
        b1.setTitleColor(UIColor.black, for: .normal)
        
        
        //Create Button with title "Latest".
        let b2 = UIButton()
        b2.setTitle("인생떡볶이집", for: .normal)
        b2.frame = CGRect(x: CGFloat(105), y: CGFloat(0), width: CGFloat(95), height: CGFloat(35))
        b2.setTitleColor(UIColor.black, for: .normal)
        
        
        //Create UIView and Setup UIView
        let view = UIView()
        view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(365), height: CGFloat(60))
        view.backgroundColor = UIColor.white
        
        
        //Add Button In UIView
        view.addSubview(b1)
        view.addSubview(b2)
        
        b1.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.leading.equalTo(view.snp.leading)
        }
        b2.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.leading.equalTo(b1.snp.trailing)
        }
        
        //Return UiView
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear

        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(StoreDetailViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 114.0
        default:
            return 200.0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.title = "떡볶이집이름으로변경"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.title = ""
        }
    }
    
//    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//        if section == 0 {
//            self.title = "떡볶이집이름으로변경"
//        }
//    }
}
