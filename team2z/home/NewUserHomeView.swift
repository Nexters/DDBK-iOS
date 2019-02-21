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
            make.bottom.equalTo(self.snp.bottom).offset(-158)
        }
    }
}
