//
//  NewUserView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class NewUserView: UIView {
    
    var recommendDHButton = UIButton()

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
//        userWellcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 26)
        self.backgroundColor = .gray
        recommendDHButton.backgroundColor = .clear
        recommendDHButton.setTitle("추천 떡후 보기", for: .normal)
        recommendDHButton.setTitleColor(orangeColor, for: .normal)
        recommendDHButton.layer.borderColor = orangeColor.cgColor
//        recommendDHButton.layer.cornerRadius = 5
        recommendDHButton.layer.cornerRadius = recommendDHButton.frame.height/2 // 원형
        recommendDHButton.layer.borderWidth = 5
        recommendDHButton.layer.masksToBounds = false
        recommendDHButton.clipsToBounds = true
        self.addSubview(recommendDHButton)
        recommendDHButton.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.368)
            make.height.equalTo(self.snp.width).multipliedBy(0.08)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(-158)
        }
    }

}
