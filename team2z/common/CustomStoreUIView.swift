//
//  CustomStoreUIView.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class CustomStoreUIView: UIView {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var redpepperButton: UIButton!
    @IBOutlet weak var dduckButton: UIButton!
    
    private let xibName = "CustomStoreUIView"
    
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
        
        // 별점 숫자 설정
        ratingLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
//            make.leading.equalTo(self.snp.leading).offset(20)
        }
        // 별 그림 설정
        cosmosView.settings.updateOnTouch = false // 조절 못하게 설정
        cosmosView.settings.fillMode = .precise // full, half, precise
        cosmosView.settings.starMargin = 0.1
        cosmosView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(ratingLabel.snp.trailing).offset(5)
        }
        // 맵기, 떡 버튼 설정
        makeRoundedButton(dduckButton)
        makeRoundedButton(redpepperButton)
        dduckButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(self.snp.trailing)
        }
        redpepperButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalTo(dduckButton.snp.leading).offset(-6)
        }
        
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
    
    func makeRoundedButton(_ view: UIButton) {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 236.0/255.0, green: 236.0/255.0, blue: 236.0/255.0, alpha: 1.0).cgColor
        view.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 66.5, height: 22))
        }
    }

}
