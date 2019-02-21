//
//  NewUserUIView.swift
//  team2z
//
//  Created by 정인호 on 21/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
//import SnapKit

class NewUserUIView: UIView {
//    @IBOutlet weak var leftLogoImageView: UIImageView!
//    @IBOutlet weak var rightLogoImageView: UIImageView!
//    @IBOutlet weak var userWellcomeLabel: UILabel!
//    @IBOutlet weak var recommendDHButton: UIButton!
    
    private let xibName = "NewUserUIView"
    
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
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
//        leftLogoImageView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(200)
//            make.leading.equalTo(self.snp.leading).offset(122)
//        }
//        rightLogoImageView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(200)
//            make.trailing.equalTo(self.snp.trailing).offset(-101)
//        }
        
//        userWellcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 26)
//
//
//        recommendDHButton.layer.borderColor = orangeColor.cgColor
////        recommendDHButton.layer.cornerRadius = 5
//                self.layer.cornerRadius = self.frame.height/2 // 원형
//        recommendDHButton.layer.borderWidth = 5
//        recommendDHButton.layer.masksToBounds = false
//        recommendDHButton.clipsToBounds = true
//        recommendDHButton.snp.makeConstraints { (make) in
//            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.368)
//            make.height.equalTo(self.snp.width).multipliedBy(0.08)
//            make.centerX.equalTo(self.snp.centerX)
//            make.bottom.equalTo(self.snp.bottom).offset(-158)
//        }
    }

}
