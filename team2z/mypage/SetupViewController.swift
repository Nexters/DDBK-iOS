//
//  SetupViewController.swift
//  team2z
//
//  Created by 정인호 on 18/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

class SetupViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    let menuLabels: [String] = ["사용가이드", "문의하기", "약관 및 정책", "로그아웃", "버전 1.6.0"]
    
    private lazy var loginViewController = { () -> LoginViewController in
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:nil)
        return storyBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
        // custom back button 설정
//        let backbutton = UIButton(type: .custom)
//        backbutton.setImage(UIImage(named: "left_arrow.png"), for: .normal) // Image can be downloaded from here below link
//        backbutton.setTitle("", for: .normal)
//        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
//        backbutton.addTarget(self, action: #selector("backActionTest"), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.isScrollEnabled = false
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
        
        if indexPath.row == 3 {
            if GIDSignIn.sharedInstance().hasAuthInKeychain() {
                // Signed in
                cell.setupLabel?.text = menuLabels[indexPath.row]
            } else {
                cell.setupLabel?.text = "로그인"
            }
            
        } else {
            cell.setupLabel?.text = menuLabels[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 3 {
            if GIDSignIn.sharedInstance().hasAuthInKeychain() {
                // Signed in, 로그아웃 처리
                // 로그아웃이 성공적으로 됐는지 안됐는지 어떻게 확인하지?
                GIDSignIn.sharedInstance().signOut()
                let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
                cell.setupLabel?.text = "로그인"
                self.navigationController?.popToRootViewController(animated: true)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                print(appDelegate.window!.rootViewController as Any)
                let baseVC = appDelegate.window!.rootViewController as! BaseViewController
                baseVC.baseTabBar.selectedIndex = 0
                print("로그아웃처리끝")
                
            } else {
                // 비 로그인 상태라면
//                var window: UIWindow?
//                window = UIWindow(frame: UIScreen.main.bounds)
//                window?.rootViewController = loginViewController
//                window?.makeKeyAndVisible()
                
                loginViewController.loginModalDelegate = self
                loginViewController.isModallyPresented = true
//                self.navigationController?.present(loginViewController, animated: true, completion: nil)
               loginViewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(loginViewController, animated: true)
                
//                GIDSignIn.sharedInstance()?.signIn()
            }
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func handleTap_0(sender: UITapGestureRecognizer) {
        print("tap0 in mpvc")
        self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
}

extension SetupViewController: LoginModalDelegate {
    func didContinueAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
