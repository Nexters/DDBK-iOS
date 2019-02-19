//
//  WriteReviewView.swift
//  team2z
//
//  Created by MOONJUNG on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class WriteReviewView: UIView {
    
    var question: UILabel! //질문
    var comment: UILabel! //한줄평

    override init(frame: CGRect) {
        super.init(frame: frame)
        initItems()
        snapKitLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initItems()
        snapKitLayout()
    }
    
    func initItems(){
        question = UILabel()
        comment = UILabel()
        
        self.question.numberOfLines = 2
        self.question.text = "방문하신 스토어\n어떠셨어요?"
        self.question.textAlignment = .center
        self.question.font = UIFont.boldSystemFont(ofSize: 28.0)
        
        self.comment.text = "좋았어요!"
        self.comment.textAlignment = .center
        
        self.addSubview(question)
        self.addSubview(comment)
    }
    
    func snapKitLayout(){
        self.question.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(30)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-60)
        }
        
        self.comment.snp.makeConstraints { (make) in
            make.top.equalTo(self.question).offset(80)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(60)
        }
    }


}
