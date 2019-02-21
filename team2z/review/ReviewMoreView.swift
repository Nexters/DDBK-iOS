//
//  ReviewMoreView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class ReviewMoreView: UIView {

    var reviewTextLabel: UILabel?
    var reviewMoreLabel: UILabel?
    
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
        
        // 리뷰 텍스트 레이블 생성 및 설정
        reviewTextLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        reviewTextLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14.0)
        reviewTextLabel!.textColor = UIColor(red: 133.0/255.0, green: 133.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        reviewTextLabel!.text = "청년다방 응암오거리점 최고에요"
        self.addSubview(reviewTextLabel!)
        reviewTextLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.776)
            //            make.height.equalTo(storeNameLabel!.snp.height)
            //            make.centerY.equalTo(self.snp.centerY)
            make.top.equalTo(self.snp.top).offset(13)
            make.leading.equalTo(self.snp.leading)
        }
        
        // 리뷰 더보기 레이블 생성 및 설정
        reviewMoreLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        reviewMoreLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)
        reviewMoreLabel!.textColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        reviewMoreLabel!.textAlignment = .right
        reviewMoreLabel!.text = "더보기"
        self.addSubview(reviewMoreLabel!)
        reviewMoreLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.776)
            make.top.equalTo(reviewTextLabel!.snp.bottom).offset(2)
            make.leading.equalTo(self.snp.leading)
        }
        
    }
}
