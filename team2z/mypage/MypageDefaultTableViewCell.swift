//
//  MypageDefaultTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class MypageDefaultTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        arrowButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        numberLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(arrowButton.snp.leading).offset(-5)
            make.centerY.equalTo(self.snp.centerY)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
