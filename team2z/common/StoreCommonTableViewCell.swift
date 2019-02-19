//
//  StoreCommonTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class StoreCommonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var centerLineView: UIView!
    @IBOutlet weak var StoreFooterUIView: CustomStoreUIView!
    @IBOutlet weak var verticalLineView: UIView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 떡볶이집 이름 레이블 설정
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        // 떡볶이집 주소 레이블 설정
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        // 주소 옆 수직선 뷰 설정
        verticalLineView.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(addressLabel.snp.height)
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            make.leading.equalTo(addressLabel.snp.trailing).offset(12)
        }
        verticalLineView.backgroundColor = .white
        // 전화번호 뷰 설정
        phoneNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            make.leading.equalTo(verticalLineView.snp.trailing).offset(12)
        }
        // 화살표 레이블 설정
        arrowLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(23)
            make.trailing.equalTo(self.snp.trailing).offset(-23)
        }
        // 가운데 회색 수평선 뷰 설정
        centerLineView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(1)
            make.top.equalTo(addressLabel.snp.bottom).offset(11)
            make.centerX.equalTo(self.snp.centerX)
        }
        // footer view 설정
        StoreFooterUIView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(self.snp.height).multipliedBy(0.21)
//            make.top.equalTo(centerLineView.snp.bottom).offset(11)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
