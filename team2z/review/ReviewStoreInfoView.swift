//
//  ReviewStoreInfoView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class ReviewStoreInfoView: UIView {

    var storeNameLabel: UILabel?
    var storeAddressLabel: UILabel?
    var storePinButton: UIButton?
    
    var isPinnedStore = false
    
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
        self.layer.borderColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0).cgColor
        self.layer.cornerRadius = 5
//        self.layer.cornerRadius = self.frame.height/2 // 원형
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        // 가게 이름 레이블 생성 및 설정
        storeNameLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        storeNameLabel!.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16.0)
        storeNameLabel!.text = "청년다방 응암오거리점 >"
        self.addSubview(storeNameLabel!)
        storeNameLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.776)
//            make.height.equalTo(storeNameLabel!.snp.height)
//            make.centerY.equalTo(self.snp.centerY)
            make.top.equalTo(self.snp.top).offset(13)
            make.leading.equalTo(self.snp.leading).offset(15)
        }
        
        // 가게 주소 레이블 생성 및 설정
        storeAddressLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(28)))
        storeAddressLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12.0)
        storeAddressLabel!.textColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        storeAddressLabel!.textAlignment = .right
        storeAddressLabel!.text = "서울시 은평구 응암로 102-39"
        self.addSubview(storeAddressLabel!)
        storeAddressLabel!.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.776)
            make.top.equalTo(storeNameLabel!.snp.bottom).offset(4)
            make.leading.equalTo(self.snp.leading).offset(15)
        }
        
        // 핀 버튼 생성 및 설정
        storePinButton = UIButton()
        storePinButton!.setImage(UIImage(named: "mypage_pin"), for: .normal)
        storePinButton!.imageView?.contentMode = .scaleAspectFit
//        storePinButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
//        storePinButton.backgroundColor = .blue
        self.addSubview(storePinButton!)
        storePinButton!.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        storePinButton!.addTarget(self, action: #selector(self.storePinButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func storePinButtonPressed(sender: UIButton) {
        print("가고싶어요 핀 버튼을 선택했습니다.")
        if isPinnedStore { // 가고싶어요에 등록된 상태 -> 가고싶어요 목록에서 제거
            isPinnedStore = false
            sender.layer.borderWidth = 0
        } else { // 가고싶어요 목록에 등록되지 않은 상태 -> 가고싶어요 목록에 추가
            isPinnedStore = true
            sender.layer.borderWidth = 2
        }
    }
}
