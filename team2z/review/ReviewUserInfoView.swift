//
//  ReviewUserInfoView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class ReviewUserInfoView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    private let xibName = "ReviewUserInfoView"
    
    var profileImageView: UIImageView?
    var profileNameLabel: UILabel?
    var followButton: UIButton?
    var reviewCreationDateLabel: UILabel?
    var reviewMenuButton: UIButton?
    
    let orangeColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
//        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
//        view.frame = self.bounds
//        self.addSubview(view)
        self.backgroundColor = .clear
        // 프로필 사진 이미지 뷰 생성 및 설정
        profileImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(28), height: CGFloat(28)))
        do {
            let url = URL(string: "https://via.placeholder.com/150/92c952")
            let data = try Data(contentsOf: url!)

            profileImageView!.image = UIImage(data: data)
        } catch {
            profileImageView!.image = UIImage(named: "profile_default_male")
        }
        profileImageView?.backgroundColor = .blue
        profileImageView!.layer.borderWidth = 0
        profileImageView!.layer.masksToBounds = false
        profileImageView!.layer.cornerRadius = profileImageView!.frame.height/2
        profileImageView!.clipsToBounds = true
        
        self.addSubview(profileImageView!)
        profileImageView!.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.0836)
            make.height.equalTo(profileImageView!.snp.width)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading)
        }
        
        // 유저 이름 레이블 생성 및 설정
        profileNameLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        profileNameLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        profileNameLabel!.text = "떡볶이일진"
        self.addSubview(profileNameLabel!)
        profileNameLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.447)
            make.height.equalTo(profileImageView!.snp.height)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(profileImageView!.snp.trailing).offset(6)
        }
        
        // 팔로우(팔로잉) 버튼 생성 및 설정 followButton
//        followButton =
        let followButton = UIButton()
        followButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        followButton.setTitle("팔로우", for: .normal)
        followButton.setTitleColor(orangeColor, for: .normal)
        followButton.backgroundColor = .clear
        followButton.layer.borderWidth = 0
        self.addSubview(followButton)
        followButton.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(18)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(profileNameLabel!.snp.trailing).offset(6)
        }
//        followButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        followButton.titleLabel?.minimumScaleFactor = 0.5
//        followButton.addTarget(self, action: #selector(self.addWantToGoAction), for: .touchUpInside)
        
        // 리뷰 메뉴 버튼 생성 및 설정 reviewMenuButton
        let reviewMenuButton = UIButton()
        reviewMenuButton.setImage(UIImage(named: "more"), for: .normal)
        self.addSubview(reviewMenuButton)
        reviewMenuButton.snp.makeConstraints { (make) in
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        // 리뷰 작성 날짜 레이블 생성 및 설정
        reviewCreationDateLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        reviewCreationDateLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12.0)
        reviewCreationDateLabel!.textColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        reviewCreationDateLabel!.textAlignment = .right
        reviewCreationDateLabel!.text = "오늘"
        self.addSubview(reviewCreationDateLabel!)
        reviewCreationDateLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.203)
            make.height.equalTo(profileImageView!.snp.height)
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(reviewMenuButton.snp.leading).offset(-10)
        }
        
    }

}
