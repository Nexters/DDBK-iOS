//
//  UserFollowTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 20/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class UserFollowTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    var isFollowUser: Bool = false
    
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
        // 팔로우 버튼
//        followButton.backgroundColor = .clear
        followButton.layer.cornerRadius = 5
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0).cgColor
        followButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 66.5, height: 22))
//            make.top.equalTo(self.snp.top).offset(39.5)
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func followAction(_ sender: UIButton) {
        if isFollowUser { // 팔로잉 -> 팔로우 // 팔로우 취소
            isFollowUser = false
            let followColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
            followButton.setTitle("팔로우 +", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = followColor
            followButton.layer.borderColor = followColor.cgColor
        } else { // 팔로우(주황) -> 팔로잉(초록) : 팔로우 하기
            isFollowUser = true
            let followedColor = UIColor(red: 107.0/255.0, green: 160.0/255.0, blue: 75.0/255.0, alpha: 1.0)
            followButton.setTitle("팔로잉", for: .normal)
            followButton.setTitleColor(followedColor, for: .normal)
            followButton.backgroundColor = .white
            followButton.layer.borderColor = followedColor.cgColor
        }
    }
    
}
