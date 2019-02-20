//
//  ProfileInfoTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 20/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class ProfileInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        infoLabel.snp.makeConstraints { (make) in
            make.width.equalTo(87)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        infoTextField.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.67)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(infoLabel.snp.trailing).offset(15)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
