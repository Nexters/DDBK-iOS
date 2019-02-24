//
//  MypageCommonViewController.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import DropDown

class MypageCommonViewController: UIViewController {
    var customTitle: String?
    var cellType: String?
    
//    let filterView = UIView()
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownIconImageView: UIImageView!
    let dropDown = DropDown()
    let dropDownMenu = ["최신 등록순", "별점순", "맵기순", "떡순"]
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    @IBAction func showFilterButtonDropDown(_ sender: Any) {
        dropDown.cancelAction = {
            self.dropDownIconImageView.image = UIImage(named: "expand-1.png")
        }
        dropDown.selectionAction = { (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.dropDownButton.setTitle(item, for: .normal)
            self.dropDownIconImageView.image = UIImage(named: "expand-1.png")
        }
        
        dropDown.width = 140
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.show()
        dropDownIconImageView.image = UIImage(named: "collapse-1.png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let passedTitle = customTitle {
            self.title = passedTitle
        } else {
            self.title = "common..."
        }
        

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        filterView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
//        self.view.addSubview(filterView)
        filterView.snp.makeConstraints { (make) in
//            make.top.bottom.left.right.equalTo(self.view)
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.05)
        }
        // filterView의 드롭다운 생성 및 설정
        dropDown.anchorView = dropDownButton // UIView or UIBarButtonItem
        dropDown.dataSource = ["최신 등록순", "별점순", "맵기순", "떡순"]
        dropDownButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(filterView.snp.centerY)
            make.leading.equalTo(filterView.snp.leading).offset(20)
        }
        dropDownIconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(16)
            make.height.equalTo(15)
            make.centerY.equalTo(filterView.snp.centerY)
            make.leading.equalTo(dropDownButton.snp.trailing).offset(5)
        }

        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
//        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(filterView.snp.bottom)
//            make.bottom.left.right.equalTo(self.view)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.95)
            make.width.equalTo(self.view.snp.width)
        }
        
        let nibName_1 = UINib(nibName: "StoreCommonTableViewCell", bundle: nil)
        myTableView.register(nibName_1, forCellReuseIdentifier: "StoreCommonCell")
        
        let nibName_2 = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        myTableView.register(nibName_2, forCellReuseIdentifier: "ReviewTableViewCell")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

extension MypageCommonViewController: UITableViewDelegate {
    
}
extension MypageCommonViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType {
        case "가고싶어요":
            // 가고싶어요
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "StoreCommonCell") as! StoreCommonTableViewCell
            cell2.StoreFooterUIView.ratingLabel?.text = "3.5"
            cell2.StoreFooterUIView.cosmosView.rating = 2.5
            cell2.selectionStyle = .none
            
            return cell2
        default:
            // 갔다왔어요 & 좋아요한 리뷰
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
            cell.selectionStyle = .none
            // uiview tap 제어
            let tapGesture_0 = UITapGestureRecognizer(target: self, action: #selector(goToStoreDetail))
            //            let tapGesture_1 = UITapGestureRecognizer(target: self, action: #selector(goToStoreDetail))
            let tapGesture_2 = UITapGestureRecognizer(target: self, action: #selector(goToImageTouchView(tapGestureRecognizer:)))
            cell.reviewStoreInfoView.addGestureRecognizer(tapGesture_0)
            cell.reviewImageView.addGestureRecognizer(tapGesture_2)
            cell.reviewImageView.isUserInteractionEnabled = true
            
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
        
        switch cellType {
        case "갔다왔어요":
            // 갔다왔어요
            break
        case "가고싶어요":
            // 가고싶어요
            self.navigationController?.pushViewController(StoreDetailViewController(), animated: true)
            break
        default:
            // 좋아요한 리뷰
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch cellType {
        case "가고싶어요":
            // 가고싶어요
            return 98.0
        default:
            // 갔다왔어요 & 좋아요한 리뷰
            return UIScreen.main.bounds.width * 1.2347
        }
        
    }
    
    @objc func goToStoreDetail(sender: UITapGestureRecognizer) {
       self.navigationController?.pushViewController(StoreDetailViewController(), animated: true)
    }
    @objc func goToImageTouchView(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let vc = ImageTouchViewController()
        vc.reviewImageView = tappedImage
        self.present(vc, animated: true, completion: nil)
    }
}
