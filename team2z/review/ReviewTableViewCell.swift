//
//  ReviewTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var reviewUserInfoView: ReviewUserInfoView!
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var reviewRatingView: CustomStoreUIView!
    @IBOutlet weak var reviewStoreInfoView: ReviewStoreInfoView!
    @IBOutlet weak var reviewMoreView: ReviewMoreView!
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var reviewLikeView: ReviewLikeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 리뷰 유저 정보 뷰 설정
        reviewUserInfoView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.099)
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
        }
        // 가운데 회색 수평선 뷰 설정
        firstLineView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(1)
            make.top.equalTo(reviewUserInfoView.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
        }
        // 리뷰 평점 정보 뷰 설정
        reviewRatingView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.095)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(firstLineView.snp.bottom)
        }
        // 가게 정보 뷰 설정
        reviewStoreInfoView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.129)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(reviewRatingView.snp.bottom)
        }
        // 리뷰 두줄 보기 및 더보기 뷰 설정
        reviewMoreView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.172)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(reviewStoreInfoView.snp.bottom)
        }
        // 리뷰 이미지뷰 설정
        reviewImageView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.388)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(reviewMoreView.snp.bottom)
        }
        // 두번째 회색 수평선 뷰 설정
        secondLineView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(1)
            make.top.equalTo(reviewImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        // 리뷰 좋아요 개수 뷰 설정
        reviewLikeView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.0885)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(secondLineView.snp.bottom)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
