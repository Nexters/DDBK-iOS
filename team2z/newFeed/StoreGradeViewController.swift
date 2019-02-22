//
//  StoreGradeViewController.swift
//  team2z
//
//  Created by MOONJUNG on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class StoreGradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var searchResultTableView: UITableView!
    private var writeReviewView: WriteReviewFinal!
    private var touchImageView: UIBarButtonItem!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isToolbarHidden = true
        
        self.title = "리뷰 쓰기"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(self.backAction(_:)))
        initItems()
        setSnapKitLayout()
    }
    
    func initItems(){
        searchResultTableView = UITableView()
        touchImageView = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(add))
        var items = [UIBarButtonItem]()
        
        self.searchResultTableView.delegate = self
        self.searchResultTableView.dataSource = self
        self.searchResultTableView.register(ResultStoreTableViewCell.self, forCellReuseIdentifier: "result")
        self.searchResultTableView.rowHeight = 60
    
        items.append(touchImageView)
        self.toolbarItems = items
        
        // 왜 searchResultTableView.visibleCells가 없는가ㅏㅏㅏㅏㅜㅜㅜ
        /*let cells = self.searchResultTableView.visibleCells
        print("cells:\(cells)")
        var height: CGFloat = 0
        for i in 0..<cells.count {
            height += cells[i].frame.height
        }
        print("height:\(height)")

        height = self.searchResultTableView.bounds.height - ceil(height)
        print("height22: \(height)")
        writeReviewView = WriteReviewView(frame: CGRect(x: 0, y: 0, width: self.searchResultTableView.frame.width, height: height))

        height = height > 0 ? height : 0*/
    
//        self.searchResultTableView.tableFooterView = writeReviewView
//        self.searchResultTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        writeReviewView = WriteReviewFinal(frame: CGRect(x: 0, y: 0, width: self.searchResultTableView.frame.width, height: view.frame.height))
        self.searchResultTableView.tableFooterView = writeReviewView
        writeReviewView.backgroundColor = UIColor.white
        self.view.addSubview(searchResultTableView)

    }
    
    @objc func add(){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    func setSnapKitLayout(){
        
        self.searchResultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.left.width.height.equalTo(self.view)
        }
        
//        self.writeReviewView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.searchResultTableView).offset(30)
//            make.left.width.height.equalTo(self.view)
//        }
        

    }
    
    @IBAction func backAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        //        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.pushViewController(writeReviewView, animated: true)
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
    
    
    

 
}
