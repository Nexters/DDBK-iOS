//
//  NewFeedViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class NewFeedViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    // variable
    private var naviBar: UINavigationBar!
    private var storeIcon: UIImageView!
    private var searchStoreBar: UISearchBar!
    private var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "리뷰 쓰기"
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backbutton.png"), style: .plain, target: self, action: nil)
//        let backbutton = UIBarButtonItem()
//        backbutton.title = "뒤로가기"
//        backbutton.setBackgroundImage(UIImage(named: "backbutton.png"), for: .normal, style: .plain, barMetrics: .default)
        
//        backbutton.setImage(UIImage(named: "backbutton.png"), for: .normal)
//        backbutton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(self.backAction(_:)))
        
        initItems()
        setSnapKitLayout()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    // init
    func initItems(){
        searchStoreBar = UISearchBar()
        storeIcon = UIImageView()
        searchResultTableView = UITableView()
        
        self.searchStoreBar.delegate = self
        self.searchStoreBar.placeholder = "스토어를 검색하세요"
        self.searchStoreBar.searchBarStyle = UISearchBar.Style.minimal
        
        self.searchResultTableView.delegate = self
        self.searchResultTableView.dataSource = self
        self.searchResultTableView.register(SearchStoreTableViewCell.self, forCellReuseIdentifier: "search")
        self.searchResultTableView.rowHeight = 90
        
        storeIcon.image = UIImage(named: "store.png")
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(searchStoreBar)
        self.view.addSubview(searchResultTableView)
    }

    func setSnapKitLayout(){
        
        self.searchStoreBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view).offset(80)
            make.width.equalTo(self.view)
            make.height.equalTo(40)
        }
        
        self.searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchStoreBar).offset(50)
            make.left.width.height.equalTo(self.view)
        }
        
    }
    
    //가게 이름 검색할 때
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.searchResultTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchStoreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath) as! SearchStoreTableViewCell
        
        cell.storeName.text = "엽기 떡볶이 신촌점"
        cell.storeAddress.text = "서울특별시 중구"
        cell.starImage.image = UIImage(named: "star.png")
        cell.storeScore.text = "2.0"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.navigationController?.pushViewController(GradeViewController(), animated: true)
    }
   
}
