//
//  HomeViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit
import CoreSpotlight

class HomeViewController: UIViewController {
    
//    var newUserUIView = NewUserUIView(frame: self.view.frame)
    let testStr = "HomeViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = navTitleWithImageAndText(titleText: " 떡슐랭", imageName: "home_title_icon")        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeSearchButton())
        
        let newUserUIView = NewUserHomeView(frame: self.view.frame)
        self.view.addSubview(newUserUIView)
        newUserUIView.snp.makeConstraints { (make) in
            
            make.top.bottom.left.right.equalTo(self.view)
        }
        newUserUIView.recommendDHButton.addTarget(self, action: #selector(self.recommendBHButtonPressed), for: .touchUpInside)

        
    }
    
    func navTitleWithImageAndText(titleText: String, imageName: String) -> UIView {
        
        // Creates a new UIView
        let titleView = UIView()
        
        // Creates a new text label
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)
        label.text = titleText
        label.sizeToFit()
        label.center = titleView.center
        label.textAlignment = NSTextAlignment.center
        
        // Creates the image view
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        
        // Maintains the image's aspect ratio:
        let imageAspect = image.image!.size.width / image.image!.size.height
        
        // Sets the image frame so that it's immediately before the text:
        let imageX = label.frame.origin.x - label.frame.size.height * imageAspect
        let imageY = label.frame.origin.y
        
        let imageWidth = label.frame.size.height * imageAspect
        let imageHeight = label.frame.size.height
        
        image.frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
        
        image.contentMode = UIView.ContentMode.scaleAspectFit
        
        // Adds both the label and image view to the titleView
        titleView.addSubview(label)
        titleView.addSubview(image)
        
        // Sets the titleView frame to fit within the UINavigation Title
        titleView.sizeToFit()
        
        return titleView
        
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
    
    @objc func recommendBHButtonPressed() {
        self.navigationController?.pushViewController(RecommendDHViewController(), animated: true)
    }
    
    // Spotlight에서 아이템을 선택했을 때 호출되는 메소드
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType, let info = activity.userInfo, let selectedIdentifier = info[CSSearchableItemActivityIdentifier] as? String {
            print("Selected Identifier: \(selectedIdentifier)")
            let storyboard = UIStoryboard(name: "ScrollSegmented", bundle: nil)
            let openNewVC = storyboard.instantiateViewController(withIdentifier: "ResultSearchVC") as! ResultSearchViewController
            openNewVC.delegateHomeSearchControllerDelegate = self
            openNewVC.searchKeyword = selectedIdentifier
            self.navigationController?.pushViewController(openNewVC, animated: true)
        }
    }
}

extension HomeViewController: HomeSearchControllerDelegate {
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
