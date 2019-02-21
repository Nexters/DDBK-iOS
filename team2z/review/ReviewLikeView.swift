//
//  ReviewLikeView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class ReviewLikeView: UIView {

    var reviewLikeButton: UIButton?
    var reviewLikeNumberLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        
        // 핀 버튼 생성 및 설정
        reviewLikeButton = UIButton()
        reviewLikeButton!.setImage(UIImage(named: "mypage_like"), for: .normal)
        reviewLikeButton!.imageView?.contentMode = .scaleAspectFit
        //        storePinButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        //        storePinButton.backgroundColor = .blue
        self.addSubview(reviewLikeButton!)
        reviewLikeButton!.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
//            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        // 가게 주소 레이블 생성 및 설정
        reviewLikeNumberLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        reviewLikeNumberLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12.0)
        reviewLikeNumberLabel!.textColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        reviewLikeNumberLabel!.textAlignment = .right
        reviewLikeNumberLabel!.text = "000"
        self.addSubview(reviewLikeNumberLabel!)
        reviewLikeNumberLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.3)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(reviewLikeButton!.snp.trailing).offset(7)
        }
    }
}
