//
//  MypageDefaultTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class MypageDefaultTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
