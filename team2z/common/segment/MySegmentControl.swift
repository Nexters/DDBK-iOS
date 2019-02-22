//
//  MySegmentControl.swift
//  team2z
//
//  Created by 정인호 on 23/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class MySegmentControl: UISegmentedControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.commonInit()
    }
    
//    private func commonInit(){
//        self.segment.addUnderlineForSelectedSegment()
//        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 13.0)!], for: .selected)
//        (self.subviews[0] as UIView).tintColor = .gray
//        (self.subviews[1] as UIView).tintColor = .gray
//        self.translatesAutoresizingMaskIntoConstraints = false
//        if #available(iOS 11.0, *) {
//            let guide = self.view.safeAreaLayoutGuide
//            segment.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//            segment.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//            segment.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
//            segment.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            //        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//        } else {
//            NSLayoutConstraint(item: segment,
//                               attribute: .top,
//                               relatedBy: .equal,
//                               toItem: view, attribute: .top,
//                               multiplier: 1.0, constant: 0).isActive = true
//            NSLayoutConstraint(item: segment,
//                               attribute: .leading,
//                               relatedBy: .equal, toItem: view,
//                               attribute: .leading,
//                               multiplier: 1.0,
//                               constant: 0).isActive = true
//            NSLayoutConstraint(item: segment, attribute: .trailing,
//                               relatedBy: .equal,
//                               toItem: view,
//                               attribute: .trailing,
//                               multiplier: 1.0,
//                               constant: 0).isActive = true
//
//            segment.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        }
//
//    }

}

