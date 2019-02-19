//
//  MyTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileModifyButton: UIButton!
    @IBOutlet weak var profileDescLabel: UILabel!
    @IBOutlet weak var profileNimLabel: UILabel!
    
    @IBOutlet var profileSubViews: [UIView]!
    @IBOutlet var subImageViews: [UIImageView]!
    @IBOutlet var subImageLabels: [UILabel]!
    @IBOutlet var subVarLabels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        // 프로필 사진 이미지 뷰
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        // 닉네임 레이블
//        profileNameLabel.snp.makeConstraints { (make) in
//            make.width.lessThanOrEqualTo(150)
//
        // "님" 레이블
        profileNimLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(33)
            make.leading.equalTo(profileNameLabel.snp.trailing).offset(5)
        }
        
        // 수정하기 버튼
        profileModifyButton.backgroundColor = .clear
        profileModifyButton.layer.cornerRadius = 5
        profileModifyButton.layer.borderWidth = 1
        profileModifyButton.layer.borderColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        profileModifyButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 66.5, height: 22))
            make.top.equalTo(self.snp.top).offset(39.5)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
        }
        // 서브뷰들
        profileSubViews[0].snp.makeConstraints { (make) in
            make.width.height.equalTo(self.snp.width).multipliedBy(0.3)
            make.top.equalTo(profileDescLabel.snp.bottom).offset(15)
//            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        profileSubViews[1].snp.makeConstraints { (make) in
            make.width.height.equalTo(self.snp.width).multipliedBy(0.3)
            make.top.equalTo(profileDescLabel.snp.bottom).offset(15)
//            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.leading.equalTo(profileSubViews[0].snp.trailing)
        }
        profileSubViews[2].snp.makeConstraints { (make) in
            make.width.height.equalTo(self.snp.width).multipliedBy(0.3)
            make.top.equalTo(profileDescLabel.snp.bottom).offset(15)
//            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.leading.equalTo(profileSubViews[1].snp.trailing)
        }
        for view in profileSubViews {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func modifyAction(_ sender: UIButton) {
        
    }
    
}
