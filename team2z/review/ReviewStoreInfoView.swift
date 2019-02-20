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
    }
}
