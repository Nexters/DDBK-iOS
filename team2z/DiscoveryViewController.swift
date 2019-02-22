//
//  DiscoveryViewController.swift
//  team2z
//
//  Created by 정인호 on 23/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import DropDown

class DiscoveryViewController: UIViewController {
    var cellType: String?
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func segments(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.segment.frame.width / CGFloat(self.segment.numberOfSegments)) * CGFloat(self.segment.selectedSegmentIndex)
//            self.buttonBar.frame.origin.x += (self.segment.frame.width / CGFloat(self.segment.numberOfSegments)) * 0.333
        }
        myTableView.reloadData()
    }
    var buttonBar = UIView()
    
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
        
        self.navigationItem.title = "둘러보기"
//        self.title = "둘러보기"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeSearchButton())
        
        self.initSegmentLayout()
        self.initButtonBar()
        
        segment.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        
        filterView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        //        self.view.addSubview(filterView)
        filterView.snp.makeConstraints { (make) in
            //            make.top.bottom.left.right.equalTo(self.view)
            make.top.equalTo(segment.snp.bottom)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(35)
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
            make.bottom.left.right.equalTo(self.view)
            make.width.equalTo(self.view.snp.width)
        }
        
        let nibName_1 = UINib(nibName: "StoreCommonTableViewCell", bundle: nil)
        myTableView.register(nibName_1, forCellReuseIdentifier: "StoreCommonCell")
        
        let nibName_2 = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        myTableView.register(nibName_2, forCellReuseIdentifier: "ReviewTableViewCell")
    }
    
    func initSegmentLayout(){
        //        let segment = UIView()
        //        segment.backgroundColor = .red
        //        self.view.addSubview(segment)
        //        segment.removeBorders() // 전 버전
        segment.addUnderlineForSelectedSegment()
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
    
    func initButtonBar() {
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = .black
        view.addSubview(buttonBar)
        // Constrain the top of the button bar to the bottom of the segmented control
        buttonBar.topAnchor.constraint(equalTo: segment.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        // Constrain the button bar to the left side of the segmented control
        buttonBar.leftAnchor.constraint(equalTo: segment.leftAnchor).isActive = true
        // Constrain the button bar to the width of the segmented control divided by the number of segments
        buttonBar.widthAnchor.constraint(equalTo: segment.widthAnchor, multiplier: (1 / CGFloat(segment.numberOfSegments))*(1)).isActive = true
        
    }
    
    func makeSearchButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "home_search"), for: .normal)
        backButton.addTarget(self, action: #selector(self.searchButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func searchButtonPressed() {
        print("홈 네비게이션 검색 버튼 눌름")
        //        show(SearchViewController(), sender: <#T##Any?#>)
        
        let openNewVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        openNewVC.delegateHomeSearchControllerDelegate = self
        //        self.delegate?.pushViewController(openNewVC)
        self.present(openNewVC, animated: true, completion: nil)
    }
}

extension DiscoveryViewController: UITableViewDelegate {
    
}
extension DiscoveryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segment.selectedSegmentIndex {
        case 0:
            return 5
        default:
            return 15
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segment.selectedSegmentIndex {
        case 0:
            return 1
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segment.selectedSegmentIndex {
        case 0: // 리뷰
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
        default: // 스토어
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "StoreCommonCell") as! StoreCommonTableViewCell
            cell2.StoreFooterUIView.ratingLabel?.text = "2.8"
            cell2.StoreFooterUIView.cosmosView.rating = 2.8
            cell2.selectionStyle = .none
            
            return cell2
            
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
        
        switch segment.selectedSegmentIndex {
        case 0:
            // 리뷰
            break
        case 1:
            // 스토어
        self.navigationController?.pushViewController(StoreDetailViewController(), animated: true)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch segment.selectedSegmentIndex {
        
        case 0:
            // 리뷰
            return UIScreen.main.bounds.width * 1.2347
        case 1:
            // 스토어
            return 98.0
        default:
            return 0
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


extension DiscoveryViewController: HomeSearchControllerDelegate {
    func didPressButton(controller: SearchViewController) {
        
        let storyboard = UIStoryboard(name: "ScrollSegmented", bundle: nil)
        let openNewVC = storyboard.instantiateViewController(withIdentifier: "ResultSearchVC") as! ResultSearchViewController
        
        //        let openNewVC = SearchResultViewController(nibName: "SearchResultViewController", bundle: nil)
        openNewVC.delegateHomeSearchControllerDelegate = self
        openNewVC.searchKeyword = controller.searchKeyword
        //        self.navigationController?.pushViewController(openNewVC, animated: true)
        controller.dismiss(animated: true) { () -> Void in
            //Perform segue or push some view with your code
            self.navigationController?.pushViewController(openNewVC, animated: true)
        }
    }
    
    func didPressReturnButton(controller: ResultSearchViewController) {
        navigationController?.popViewController(animated: true)
        let openNewVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        openNewVC.delegateHomeSearchControllerDelegate = self
        //        self.delegate?.pushViewController(openNewVC)
        self.present(openNewVC, animated: true, completion: nil)
    }
}
