//
//  WriteStoreReviewController.swift
//  team2z
//
//  Created by MOONJUNG on 23/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class WriteStoreReviewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var viewScroll: UIScrollView!
    private var searchResultTableView: UITableView!
    var write:[test] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initItems()
        snapKit()
        
    }

    func initItems(){
        searchResultTableView = UITableView()
        self.searchResultTableView.delegate = self
        self.searchResultTableView.dataSource = self
        self.viewScroll.delegate = self
        
        self.searchResultTableView.register(ResultStoreTableViewCell.self, forCellReuseIdentifier: "result")
        self.searchResultTableView.rowHeight = 60
        
        self.viewScroll.isPagingEnabled = true
        
        write = createViews()
        setupViewsScrollView(write: write)
//
        self.view.addSubview(searchResultTableView)
        self.view.addSubview(viewScroll)
    }
    
    func snapKit(){
        
        self.searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.left.width.height.equalTo(self.view)
        }
        
        self.viewScroll.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchResultTableView).offset(80)
            make.left.width.equalTo(self.view)
            make.height.equalTo(self.view)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultStoreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath) as! ResultStoreTableViewCell
        
        cell.storeName.text = "엽기 떡볶이 신촌점"
        cell.storeAddress.text = "서울특별시 중구"
        
        return cell
    }
    
    
    func createViews() -> [test] {
        let testtt: test = Bundle.main.loadNibNamed("test", owner: self, options: nil)?.first as! test
        testtt.testLabel.numberOfLines = 2
        testtt.testLabel.text = "방문하신 스토어\n어떠셨어요?"
        testtt.testLabel.textAlignment = .center
        testtt.testLabel.font = UIFont.boldSystemFont(ofSize: 23.0)
        
        
        
        
    
        //Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        //WriteReviewReal()//Bundle.main.loadNibNamed("WriteReviewReal", owner: self, options: nil)?.first as! UIView
        //let slide2:UIView = WriteReviewNext()//Bundle.main.loadNibNamed("WriteReviewNext", owner: self, options: nil)?.first as! UIView
        //let slide3:UIView = WriteReviewFinal()//Bundle.main.loadNibNamed("WriteReviewFinal", owner: self, options: nil)?.first as! UIView

        return [testtt]
    }

//
    func setupViewsScrollView(write : [test]) {
        for i in 0 ..< write.count {
            write[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            self.viewScroll.addSubview(write[i])
        }
    }
    

}
