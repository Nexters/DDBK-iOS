//
//  TableViewCell.swift
//  team2z
//
//  Created by 정인호 on 17/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        arrowLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
