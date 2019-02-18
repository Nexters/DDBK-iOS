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
        navigationBarLayout()
        initItems()
        setSnapKitLayout()
    }
    
    // navigation
    func navigationBarLayout(){
        self.naviBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        let backBarButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
        let navigationItem = UINavigationItem()
        navigationItem.title = "리뷰 쓰기"
        navigationItem.leftBarButtonItem = backBarButton
        naviBar.items = [navigationItem]
        self.view.addSubview(naviBar)
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
        
        
        //self.view.addSubview(storeIcon)
        self.view.addSubview(searchStoreBar)
        self.view.addSubview(searchResultTableView)
    }

    func setSnapKitLayout(){
        
        /*self.storeIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(15)
            make.top.equalTo(self.naviBar).offset(60)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        self.searchStoreBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.storeIcon).offset(40)
            make.top.equalTo(self.naviBar).offset(60)
            make.width.equalTo(310)
            make.height.equalTo(30)
        }*/
        
        self.searchStoreBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.self.naviBar).offset(60)
            make.width.equalTo(self.view)
            make.height.equalTo(40)
        }
        
        /*self.searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.storeIcon).offset(35)
            make.left.width.height.equalTo(self.view)
        }*/
        
        self.searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchStoreBar).offset(50)
            make.left.width.height.equalTo(self.view)
        }
        
    }
    
    //가게 이름 검색할 때
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
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
   
}
