//
//  ResultSearchViewController.swift
//  team2z
//
//  Created by 정인호 on 23/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class ResultSearchViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    var delegateHomeSearchControllerDelegate: HomeSearchControllerDelegate?
    var searchKeyword: String?
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        segment.changeUnderlinePosition()
        switch sender.selectedSegmentIndex {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: 375, y: 0), animated: true)
        default:
            print("")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if searchKeyword != nil, (searchKeyword?.count)! > 0{
            self.title = "\'\(searchKeyword!)\'의 검색 결과"
        } else {
            self.title = "검색결과"
        }
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeCloseButton())
        
        self.initSegmentLayout()
//        leftTableView.snp.makeConstraints { (make) in
//            make.width.equalTo(self.view.snp.width)
//            make.top.equalTo(segment.snp.bottom)
//            make.bottom.equalTo(self.view)
//        }
        self.leftTableView.dataSource = self
        self.leftTableView.delegate = self
        
        self.rightTableView.dataSource = self
        self.rightTableView.delegate = self
        
        // xib 커스텀 셀 등록
        
        let nibName_0 = UINib(nibName: "UserFollowTableViewCell", bundle: nil)
        leftTableView.register(nibName_0, forCellReuseIdentifier: "UserFollowCell")
        let nibName_1 = UINib(nibName: "StoreCommonTableViewCell", bundle: nil)
        rightTableView.register(nibName_1, forCellReuseIdentifier: "StoreCommonCell")
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
    
    func makeBackButton() -> UIButton {
        //        let backButtonImage = UIImage(named: "left_arrow.png")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    func makeCloseButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "clear_cell_icon"), for: .normal)
        backButton.addTarget(self, action: #selector(self.closeButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        delegateHomeSearchControllerDelegate?.didPressReturnButton(controller: self)
    }
    
    @objc func closeButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension UISegmentedControl{
    func removeBorders(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
    }
    
    func addUnderlineForSelectedSegment(){
        removeBorders()
//        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineWidth: CGFloat = UIScreen.main.bounds.width / 2
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = .black
        underline.tag = 1
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{
    
    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}


// 전버전, border 없애기
//extension UISegmentedControl{
//    func changeSegmentTintColor(color: UIColor){
//
//    }
//    func removeBorders() {
//        setBackgroundImage(imageWithColor(color: .clear), for: .normal, barMetrics: .default)
//        setBackgroundImage(imageWithColor(color: .clear), for: .selected, barMetrics: .default)
//        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//    }
//
//    // create a 1x1 image with this color
//    private func imageWithColor(color: UIColor) -> UIImage {
//        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        context!.setFillColor(color.cgColor);
//        context!.fill(rect);
//        let image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return image!
//    }
//}

extension ResultSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return 15
        } else {
            return 5
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView {
            // 떡후
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserFollowCell") as! UserFollowTableViewCell
//            cell.profileImageView.image = UIImage(named: "profile_default_male")
            cell.profileImageView.backgroundColor = .gray
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCommonCell") as! StoreCommonTableViewCell
            cell.StoreFooterUIView.ratingLabel?.text = "2.8"
            cell.StoreFooterUIView.cosmosView.rating = 4.5
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView { // 떡후
            
        } else { // 스토어
            let vc = StoreDetailViewController(nibName: "StoreDetailViewController", bundle: nil)
            vc.homeSearchDelegate = self
            vc.segmentIndexFromHomeSearch = segment.selectedSegmentIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == leftTableView { // 떡후
            return 60.0
        } else { // 스토어
            return 98.0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
//        return 50.0
    }
    
    
}

extension ResultSearchViewController: HomeSearchDelegate {
    func didSelectTag(selectedSegmentIndex: Int) {
        print("홈에서의 검색 결과로 돌아왔다")
        segment.changeUnderlinePosition()
        switch selectedSegmentIndex {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: 375, y: 0), animated: true)
        default:
            print("")
        }
    }
}
