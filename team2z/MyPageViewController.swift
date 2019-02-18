//
//  MyPageViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    let items: [String] = ["작성리뷰", "위시리스트", "좋아요"]
    let menuIcons: [String] = ["mypage_went.png", "mypage_pin.png", "mypage_like.png", "mypage_setup.png"]
    let menuLabels: [String] = ["갔다 왔어요", "가고 싶어요", "좋아요한 리뷰", "설정"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MyPage"
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
//        self.myTableView.separatorStyle = .none
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        
//        let subview = UIView()
//        view.addSubview(subview)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
//            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        let nibName_0 = UINib(nibName: "MyTableViewCell", bundle: nil)
        let nibName_1 = UINib(nibName: "MypageDefaultTableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "MypageCell1")
        myTableView.register(nibName_1, forCellReuseIdentifier: "myPageDefaultCell")
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(200), height: CGFloat(200))
//        super.viewWillAppear(animated)
//    }
}


extension MyPageViewController: UITableViewDelegate {
    
}
extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MypageCell1") as! MyTableViewCell
            
            do {
                let url = URL(string: "https://via.placeholder.com/150/92c952")
                let data = try Data(contentsOf: url!)
                
                cell.profileImageView.image = UIImage(data: data)
            } catch {
                
            }
            cell.profileNameLabel?.text = "떡볶이일진"
            cell.profileNameLabel?.sizeToFit()
            cell.profileDescLabel?.text = "만 3세부터 떡볶이를 먹은 떡볶이 영재.\n밀떡파. 안매운 떡볶이파. 강남역 인근에 많이 출몰해요!"
            // uiview tap 제어
            let tapGesture_0 = UITapGestureRecognizer(target: self, action: #selector(handleTap_0))
            let tapGesture_1 = UITapGestureRecognizer(target: self, action: #selector(handleTap_1))
            let tapGesture_2 = UITapGestureRecognizer(target: self, action: #selector(handleTap_2))
            cell.profileSubViews[0].addGestureRecognizer(tapGesture_0)
            cell.profileSubViews[1].addGestureRecognizer(tapGesture_1)
            cell.profileSubViews[2].addGestureRecognizer(tapGesture_2)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myPageDefaultCell") as! MypageDefaultTableViewCell
       
            cell.iconImageView.image = UIImage(named: menuIcons[indexPath.row])
            cell.mainLabel?.text = menuLabels[indexPath.row]
            cell.numberLabel?.text = "20"
            
            return cell
        default://myPageDefaultCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "myPageDefaultCell") as! MypageDefaultTableViewCell
            
            cell.iconImageView.image = UIImage(named: menuIcons[3])
            cell.mainLabel?.text = menuLabels[3]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            print("hi")
//            self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(SetupViewController(), animated: true)
        default:
            print("hello")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 290
        default:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return CGFloat.leastNormalMagnitude
//        }
//        return tableView.sectionHeaderHeight
        
        return CGFloat.leastNormalMagnitude
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 30.0
//    }
    
    @objc func handleTap_0(sender: UITapGestureRecognizer) {
        print("tap0 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
    @objc func handleTap_1(sender: UITapGestureRecognizer) {
        print("tap1 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
    @objc func handleTap_2(sender: UITapGestureRecognizer) {
        print("tap2 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
}
