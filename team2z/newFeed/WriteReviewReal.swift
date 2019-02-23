//
//  WriteReviewReal.swift
//  team2z
//
//  Created by MOONJUNG on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class WriteReviewReal: UIView {
    private let xibName = "WriteReviewReal"
    
    @IBOutlet weak var commentLabel_1: UILabel!
    @IBOutlet weak var commentLabel_2: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
//        initItems()
//        snapKitLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
//        initItems()
//        snapKitLayout()
    }
    
    private func initItems(){
        self.commentLabel_1.numberOfLines = 2
        self.commentLabel_1.text = "방문하신 스토어\n어떠셨어요?"
        self.commentLabel_1.textAlignment = .center
        self.commentLabel_1.font = UIFont.boldSystemFont(ofSize: 23.0)
        
        
        self.starRating.starSize = 40
        self.starRating.filledColor = UIColor.yellow
        self.starRating.filledBorderColor = UIColor.gray
        self.starRating.emptyColor = UIColor.gray
        self.starRating.emptyBorderColor = UIColor.gray
        
        
        self.commentLabel_2.text = "좋았어요!"
        self.commentLabel_2.textAlignment = .center
    }
    
    private func snapKitLayout(){
        
        self.commentLabel_1.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(30)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-60)
        }
        
        self.starRating.snp.makeConstraints { (make) in
            make.top.equalTo(self.commentLabel_1).offset(80)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        self.commentLabel_2.snp.makeConstraints { (make) in
            make.top.equalTo(self.commentLabel_1).offset(80)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(60)
        }
        
    }
    
//    class func instanceFromNib() -> WriteReviewReal {
//        return UINib(nibName: "WriteReviewReal", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WriteReviewReal
//    }
    
    private func commonInit(){
        
        let view = Bundle.main.loadNibNamed("WriteReviewReal", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
//        Bundle.main.loadNibNamed("WriteReviewReal", owner: self, options: nil)
//        self.addSubview(self)
//        let view = Bundle.main.loadNibNamed("WriteReviewReal", owner: self, options: nil)?.first as! UIView
//        view.frame = self.bounds
//        self.addSubview(view)
        
//        let nib = UINib(nibName: "WriteReviewReal", bundle: nil).instantiate(withOwner: self, options: nil)
//        nib.instantiate(withOwner: self, options: nil)
//        self.addSubview(UIView.init(frame: self.bounds))

//        view.frame = self.bounds
//        self.addSubview(nib)

    }
    
}
