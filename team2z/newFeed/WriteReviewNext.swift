//
//  WriteReviewNext.swift
//  team2z
//
//  Created by MOONJUNG on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class WriteReviewNext: UIView {
    private let xibName = "WriteReviewNext"
    @IBOutlet weak var comment_1: UILabel!
    @IBOutlet weak var comment_2: UILabel!
    @IBOutlet weak var spicyRating: CosmosView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var comment_3: UILabel!
    @IBOutlet weak var dduckFirst: UIButton!
    @IBOutlet weak var dduckSecond: UIButton!
    @IBOutlet weak var comment_4: UILabel!
    @IBOutlet weak var comment_5: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        initItems()
        snapkitLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        initItems()
        snapkitLayout()
    }
    
    
    private func initItems(){
        self.comment_1.numberOfLines = 2
        self.comment_1.text = "여기 떡볶이\n얼마나 매워요?"
        self.comment_1.textAlignment = .center
        self.comment_1.font = UIFont.boldSystemFont(ofSize: 27.0)
        
        
        self.spicyRating.starSize = 40
        self.spicyRating.filledColor = UIColor.red
        self.spicyRating.filledBorderColor = UIColor.gray
        self.spicyRating.emptyColor = UIColor.gray
        self.spicyRating.emptyBorderColor = UIColor.gray
        
        
        self.comment_2.text = "별로 안매워요"
        self.comment_2.textAlignment = .center
        self.comment_2.textColor = UIColor.gray
        self.comment_2.font = self.comment_2.font.withSize(20)
        
        self.lineView.backgroundColor = UIColor.gray
        
        self.comment_3.numberOfLines = 2
        self.comment_3.text = "떡은\n밀떡? 쌀떡?"
        self.comment_3.textAlignment = .center
        self.comment_3.font = UIFont.boldSystemFont(ofSize: 27.0)
        
        self.dduckFirst.setTitle("밀떡", for: .normal)
        self.dduckFirst.setImage(UIImage(named: "ssaldduk"), for: .selected)
        self.dduckFirst.setImage(UIImage(named: "ssaldduk"), for: .normal)
        
        self.dduckSecond.setTitle("쌀떡", for: .normal)
        self.dduckSecond.setImage(UIImage(named: "ssaldduk"), for: .selected)
        self.dduckSecond.setImage(UIImage(named: "ssaldduk"), for: .normal)
        
        self.comment_4.text = "밀떡이요"
        self.comment_4.textAlignment = .center
        self.comment_4.textColor = UIColor.gray
        self.comment_4.font = self.comment_2.font.withSize(20)
        
        self.comment_5.text = "쌀떡이요"
        self.comment_5.textAlignment = .center
        self.comment_5.textColor = UIColor.gray
        self.comment_5.font = self.comment_2.font.withSize(20)

    }
    
    private func snapkitLayout(){
        self.comment_1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-90)
        }
        
        
        
        self.spicyRating.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.comment_1.snp.bottom).offset(30)
        }
        
        self.comment_2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.spicyRating.snp.bottom).offset(30)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(0.5)
            make.top.equalTo(comment_2.snp.bottom).offset(24)
        }
        
        self.comment_3.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(lineView.snp.bottom).offset(50)
        }
        
        self.dduckFirst.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(-80)
            make.centerY.equalTo(comment_3.snp.bottom).offset(30)
        }
        
        self.comment_4.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(-80)
            make.centerY.equalTo(dduckFirst.snp.bottom).offset(30)
        }
        
        self.dduckSecond.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(80)
            make.centerY.equalTo(self.dduckFirst)
        }
        
        self.comment_5.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).offset(80)
            make.centerY.equalTo(dduckSecond.snp.bottom).offset(30)
        }
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

}
