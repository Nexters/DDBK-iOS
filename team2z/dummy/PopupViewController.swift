//
//  PopupViewController.swift
//  team2z
//
//  Created by 정인호 on 25/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

//protocol PopupDelegate {
//    func movePresentingTavarr()
//}

class PopupViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
//    var popupDelegate: PopupDelegate?

//    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var storeIcon: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var line: UIView!
//    @IBOutlet weak var storeTableView: UITableView!
    
    var storeTableView: UITableView = UITableView()//UITableView(frame: CGRect.zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "리뷰쓰기"
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.isNavigationBarHidden = false
//        self.navigationController?.navigationBar.backgroundColor = .white
//        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeNextButton())
        
        self.storeIcon.image = UIImage(named: "left_arrow")
        self.searchBar.layoutIfNeeded()
        self.searchBar.delegate = self
        
        self.searchBar.becomeFirstResponder()
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.borderColor = UIColor.white.cgColor
        
        self.storeTableView.backgroundColor = UIColor.white
        self.storeTableView.separatorStyle = .none
        self.storeTableView.dataSource = self
        self.storeTableView.delegate = self
        self.storeTableView.register(SearchStoreTableViewCell.self, forCellReuseIdentifier: "search")
        self.storeTableView.rowHeight = 90
//        self.storeTableView.tableHeaderView?.frame.size = CGSize(width: storeTableView.frame.width, height: CGFloat(10))
        self.view.addSubview(self.storeTableView)
//        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    
        setLayout()
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
    
    func makeNextButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("다음", for: .normal)
        backButton.setTitleColor(UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0), for: .normal)
        backButton.addTarget(self, action: #selector(self.touchbackButton(_:)), for: .touchUpInside)
        return backButton
    }
    
    @IBAction func touchbackButton(_ sender:UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func backButtonPressed() {
        
        /*navigationController?.dismiss(animated: true, completion: {
            self.popupDelegate?.movePresentingTavarr()
        })*/
        
        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    
    }
    
    @objc func nextButtonPressed() {
        navigationController?.popViewController(animated: true)
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
        //self.navigationController?.pushViewController(StoreGradeViewController(), animated: true)
        let storyBoard : UIStoryboard = UIStoryboard(name: "WriteReviewStoryboard", bundle:nil)
        let chatViewController = storyBoard.instantiateViewController(withIdentifier: "writeReview")
        self.navigationController?.pushViewController(chatViewController, animated: true)
//        show(NewViewController(), sender: nil)
    }
    
    func setLayout(){
        storeIcon.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.top.equalTo(self.view).offset(80)
            make.left.equalTo(self.view).offset(15)
        }
        
        let searchTextField:UITextField = searchBar.subviews[0].subviews.last as! UITextField
        searchTextField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15.0)
        searchTextField.layer.cornerRadius = 15
        searchTextField.textAlignment = NSTextAlignment.left
        let image:UIImage = UIImage(named: "search_cell_icon")!
        let imageView:UIImageView = UIImageView.init(image: image)
        searchTextField.leftView = nil
        searchTextField.placeholder = "스토어를 검색하세요"
        searchTextField.rightView = imageView
        searchTextField.rightViewMode = UITextField.ViewMode.always
        
        searchBar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.91)
            make.height.equalTo(40)
            make.top.equalTo(70)
            make.leading.equalTo(storeIcon.snp.trailing)
        }
        
        
        line.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(1)
            make.top.equalTo(searchBar.snp.bottom)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        storeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom)
            make.bottom.left.right.equalTo(self.view)
        }
        
        
    }
}
