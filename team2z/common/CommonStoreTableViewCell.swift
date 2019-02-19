//
//  CommonStoreTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class CommonStoreTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var redpepperView: UIView!
    @IBOutlet weak var redpepperImageView: UIImageView!
    @IBOutlet weak var redpepperLabel: UILabel!
    @IBOutlet weak var ddukView: UIView!
    @IBOutlet weak var ddukImageView: UIImageView!
    @IBOutlet weak var dduckLabel: UILabel!
    @IBOutlet weak var centerLineView: UIView!
    
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
        
        // 별점 숫자 설정
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(22)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        // 별 그림 설정
        cosmosView.settings.updateOnTouch = false // 조절 못하게 설정
        cosmosView.settings.fillMode = .precise // full, half, precise
        cosmosView.settings.starMargin = 0.1
        cosmosView.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(22)
            make.leading.equalTo(ratingLabel.snp.trailing).offset(5)
        }
        // 매운단계, 떡종류 뷰 설정
        makeRoundedView(redpepperView)
        makeRoundedView(ddukView)

        ddukView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(self.snp.height).multipliedBy(0.21)
//            make.top.equalTo(self.snp.height).multipliedBy(0.675)
//            make.top.equalTo(centerLineView.snp.bottom).offset(9)
            make.bottom.equalTo(self.snp.bottom).offset(-13)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        redpepperView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(self.snp.height).multipliedBy(0.21)
            make.bottom.equalTo(self.snp.bottom).offset(-13)
            make.trailing.equalTo(self.snp.trailing).offset(-105)
//            make.trailing.equalTo(ddukView.snp.leading)
        }
        redpepperImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(redpepperView.snp.centerY)
        }
        redpepperLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(redpepperImageView.snp.trailing).offset(5)
            make.centerY.equalTo(redpepperView.snp.centerY)
        }
        ddukImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(redpepperView.snp.centerY)
        }
        dduckLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(ddukImageView.snp.trailing).offset(5)
            make.centerY.equalTo(redpepperView.snp.centerY)
        }
        
        
//        let view = CustomStoreUIView(frame: self.view.frame)
//        self.view.addSubview(view)
    }
    
    func makeRoundedView(_ view: UIView) {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        view.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 66.5, height: 22))
            make.top.equalTo(self.snp.top).offset(39.5)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
