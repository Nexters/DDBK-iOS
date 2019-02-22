//
//  WriteReviewReal2.swift
//  team2z
//
//  Created by MOONJUNG on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class WriteReviewReal2: UIView {
    private let xibName = "WriteReviewReal2"
    
    @IBOutlet weak var comment_1: UILabel!
    @IBOutlet weak var spicyRating: CosmosView!
    @IBOutlet weak var comment_2: UILabel!
    @IBOutlet weak var comment_3: UILabel!
    @IBOutlet weak var dduckFirst: UIButton!
    @IBOutlet weak var dduckSecond: UIButton!
    @IBOutlet weak var comment_5: UILabel!
    @IBOutlet weak var comment_4: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        initItems()
        snapKitLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        initItems()
        snapKitLayout()
    }
    
    
    private func initItems(){
        self.comment_1.numberOfLines = 2
        self.comment_1.text = "여기 떡볶이\n얼마나 매워요?"
        self.comment_1.textAlignment = .center
        self.comment_1.font = UIFont.boldSystemFont(ofSize: 23.0)
        
        self.spicyRating.starSize = 40
        self.spicyRating.filledColor = UIColor.red
        self.spicyRating.emptyColor = UIColor.gray
        
        
        self.comment_2.text = "별로 안매워요."
        self.comment_2.textAlignment = .center
        self.comment_2.textColor = UIColor.gray
        
       /* self.spicyRating.starSize = 40
        self.spicyRating.filledColor = UIColor.red
        self.spicyRating.emptyColor = UIColor.gray

        
        self.comment_2.text = "별로 안매워요."
        self.comment_2.textAlignment = .center
        self.comment_2.textColor = UIColor.gray
        
        
        self.comment_3.numberOfLines = 2
        self.comment_3.text = "떡은\n밀떡? 쌀떡?"
        self.comment_3.textAlignment = .center
        self.comment_3.font = UIFont.boldSystemFont(ofSize: 23.0)
        
        self.comment_4.text = "밀떡이요"
        self.comment_4.textAlignment = .center
        self.comment_4.textColor = UIColor.gray
        
        self.comment_5.text = "쌀떡이요"
        self.comment_5.textAlignment = .center
        self.comment_5.textColor = UIColor.gray*/
        
    }
    
    private func snapKitLayout(){
        
        self.comment_1.snp.makeConstraints { (make) in
//            make.top.equalTo(self).offset(10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-90)
        }
        
        
//        self.comment_2.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self)
//            make.centerY.equalTo(self).offset(50)
//        }
        
//        self.spicyRating.snp.makeConstraints { (make) in
////            make.width.equalTo(220)
//            make.centerX.equalTo(self)
//            make.top.equalTo(self.comment_1.snp.bottom).offset(10)
//        }
        
        /*self.spicyRating.snp.makeConstraints { (make) in
            make.top.equalTo(self.comment_1).offset(80)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        self.comment_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.comment_1).offset(80)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(60)
        }
        
        self.comment_3.snp.makeConstraints { (make) in
            make.top.equalTo(self.comment_2).offset(30)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.comment_2).offset(30)
        }
        
        self.dduckFirst.snp.makeConstraints { (make) in
            make.top.equalTo(self.comment_3).offset(20)
            make.left.equalTo(self).offset(50)
        }
        
        self.dduckSecond.snp.makeConstraints { (make) in
            make.top.equalTo(self.dduckFirst)
            make.right.equalTo(self).offset(50)
        }
        
        self.comment_4.snp.makeConstraints { (make) in
            make.top.equalTo(self.dduckFirst).offset(10)
            make.left.equalTo(self).offset(40)
        }
        
        self.comment_5.snp.makeConstraints { (make) in
            make.top.equalTo(self.dduckFirst).offset(10)
            make.right.equalTo(self).offset(50)
        }*/
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
