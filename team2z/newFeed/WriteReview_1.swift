//
//  WriteReview_1.swift
//  team2z
//
//  Created by MOONJUNG on 27/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class WriteReview_1: UIView {

    @IBOutlet weak var comment_1: UILabel!
    @IBOutlet weak var comment_2: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed("WriteReview_1", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    

}
