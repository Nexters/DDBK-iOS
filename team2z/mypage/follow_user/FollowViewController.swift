//
//  FollowViewController.swift
//  team2z
//
//  Created by 정인호 on 25/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController {
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func segments(_ sender: UISegmentedControl) {
        myTableView.reloadData()
    }
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    var userNickname: String?
    var type: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNickname = "떡볶이일진"
        self.navigationItem.title = userNickname
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        self.initSegmentLayout()
        self.segment.selectedSegmentIndex = type!
        
        // 테이블뷰 생성 및 설정
        self.myTableView.backgroundColor = .white
        self.myTableView.separatorStyle = .none
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        //        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segment.snp.bottom)
            make.bottom.left.right.equalTo(self.view)
            //            make.width.equalTo(self.view.snp.width)
        }
        
        let nibName_0 = UINib(nibName: "UserFollowTableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "UserFollowCell")
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
        navigationController?.popViewController(animated: true)
    }

    func initSegmentLayout(){
        //        let segment = UIView()
        //        segment.backgroundColor = .red
        //        self.view.addSubview(segment)
        segment.removeBorders() // 전 버전
        //        segment.addUnderlineForSelectedSegment()
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 13.0)!], for: .selected)
        (segment.subviews[0] as UIView).tintColor = .gray
        (segment.subviews[1] as UIView).tintColor = .gray
        segment.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            segment.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            segment.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            segment.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            segment.heightAnchor.constraint(equalToConstant: 50).isActive = true
            //        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        } else {
            NSLayoutConstraint(item: segment,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view, attribute: .top,
                               multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: segment,
                               attribute: .leading,
                               relatedBy: .equal, toItem: view,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0).isActive = true
            NSLayoutConstraint(item: segment, attribute: .trailing,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0).isActive = true
            
            segment.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
    }

}

extension FollowViewController: UITableViewDelegate {
    
}
extension FollowViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segment.selectedSegmentIndex {
        case 0:
            return 5
        default:
            return 10
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segment.selectedSegmentIndex {
        case 0: // 팔로워들
            // 떡후
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserFollowCell") as! UserFollowTableViewCell
            //            cell.profileImageView.image = UIImage(named: "profile_default_male")
            cell.profileImageView.backgroundColor = .gray
            return cell
        default: // 팔로잉들
            // 떡후
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserFollowCell") as! UserFollowTableViewCell
            //            cell.profileImageView.image = UIImage(named: "profile_default_male")
            cell.profileImageView.backgroundColor = .gray
            cell.followButton.sendActions(for: .touchUpInside)
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 5))
        view.backgroundColor = .clear
        
        return view
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
