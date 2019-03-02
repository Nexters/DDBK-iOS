//
//  WriteReview_2.swift
//  team2z
//
//  Created by MOONJUNG on 27/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class WriteReview_2: UIView {

    @IBOutlet weak var comment_3: UILabel!
    @IBOutlet weak var spicyRating: CosmosView!
    @IBOutlet weak var comment_4: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var comment_5: UILabel!
    @IBOutlet weak var mildduckBtn: UIButton!
    @IBOutlet weak var ssaldduckBtn: UIButton!
    @IBOutlet weak var comment_6: UILabel!
    @IBOutlet weak var comment_7: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed("WriteReview_2", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

}
