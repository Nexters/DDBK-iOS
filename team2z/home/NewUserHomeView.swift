//
//  NewUserHomeView.swift
//  team2z
//
//  Created by 정인호 on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class NewUserHomeView: UIView {
    private let xibName = "NewUserHomeView"
    let orangeColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var homeLogoImageView: UIImageView!
    @IBOutlet weak var wellcomeLabel: UILabel!
    @IBOutlet weak var wellcomeLabel_2: UILabel!
    @IBOutlet weak var wellcomeLabel_3: UILabel!
    @IBOutlet weak var recommendDHButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
        // 홈 로고 아이콘 이미지 뷰 설정
        homeLogoImageView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.4)
            make.height.equalTo(homeLogoImageView.snp.width).multipliedBy(1.06667)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-50)
        }
        // ~님 반갑습니다
        wellcomeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(homeLogoImageView.snp.bottom).offset(20)
        }
        // 떡후들을 팔로잉 해서
        wellcomeLabel_2.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(wellcomeLabel.snp.bottom).offset(10)
        }
        // 나만의 떡슐랭을 만들어 보세요!
        wellcomeLabel_3.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(wellcomeLabel_2.snp.bottom).offset(5)
        }
        
        // 추천 떡후 버튼 설정 AppleSDGothicNeo-Bold
        recommendDHButton.setTitle("추천 떡후 보기", for: .normal)
        recommendDHButton.setTitleColor(orangeColor, for: .normal)
        recommendDHButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        recommendDHButton.layer.cornerRadius = recommendDHButton.frame.height/2 // 원형
        recommendDHButton.layer.borderWidth = 2
        recommendDHButton.layer.borderColor = orangeColor.cgColor
//        recommendDHButton.layer.masksToBounds = false
//        recommendDHButton.clipsToBounds = true
        recommendDHButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.368)
            make.height.equalTo(self.snp.width).multipliedBy(0.08)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(wellcomeLabel_3.snp.bottom).offset(12)
        }
    }
}
