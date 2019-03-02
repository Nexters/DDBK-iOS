//
//  WriteReview_3.swift
//  team2z
//
//  Created by MOONJUNG on 27/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class WriteReview_3: UIView {

    @IBOutlet weak var textReview: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed("WriteReview_3", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }


}
