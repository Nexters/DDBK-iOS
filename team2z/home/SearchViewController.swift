//
//  SearchViewController.swift
//  team2z
//
//  Created by 정인호 on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton! // 0.146
    @IBOutlet weak var searchBar: UISearchBar! // 0.854
    @IBOutlet weak var firstLineView: UIView!
    
    var myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layoutIfNeeded()
        
        let searchTextField:UITextField = searchBar.subviews[0].subviews.last as! UITextField
        searchTextField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13.0)
//        searchTextField.textColor = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 206.0/255.0, alpha: 1.0)
        searchTextField.layer.cornerRadius = 15
        searchTextField.textAlignment = NSTextAlignment.left
        let image:UIImage = UIImage(named: "search_cell_icon")!
        let imageView:UIImageView = UIImageView.init(image: image)
        searchTextField.leftView = nil
        searchTextField.placeholder = "리뷰어 또는 스토어를 검색하세요"
        searchTextField.rightView = imageView
        searchTextField.rightViewMode = UITextField.ViewMode.always
//        searchTextField.backgroundColor = .green
        //
        searchBar.becomeFirstResponder()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.91)
            make.height.equalTo(40)
            make.top.equalTo(self.view.snp.bottom)
            make.leading.equalTo(backButton.snp.trailing)
        }
        // 수평선 뷰 설정
        firstLineView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(1)
            make.top.equalTo(searchBar.snp.bottom)
            make.centerX.equalTo(self.view.snp.centerX)
        }

        // 테이블뷰 생성 및 설정
        self.myTableView.separatorStyle = .none
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        let HEADER_HEIGHT = 100
        myTableView.tableHeaderView?.frame.size = CGSize(width: myTableView.frame.width, height: CGFloat(HEADER_HEIGHT))
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(firstLineView.snp.bottom)
            make.bottom.left.right.equalTo(self.view)
        }
//        backButton.backgroundColor = .red
        backButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.09)
            make.height.equalTo(40)
            make.bottom.equalTo(myTableView.snp.top)
        }
    }

    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return UITableViewCell()
        default://myPageDefaultCell
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            break
        case 2:
            self.navigationController?.pushViewController(SetupViewController(), animated: true)
        default:
            print("hello")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
}
