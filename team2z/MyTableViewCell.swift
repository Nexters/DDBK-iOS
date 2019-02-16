//
//  MyTableViewCell.swift
//  team2z
//
//  Created by 정인호 on 16/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileModifyButton: UIButton!
    @IBOutlet weak var profileDescLabel: UILabel!
    
    @IBOutlet var profileSubViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        // rgb 241 90 36
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        //
        profileModifyButton.backgroundColor = .clear
        profileModifyButton.layer.cornerRadius = 5
        profileModifyButton.layer.borderWidth = 1
        profileModifyButton.layer.borderColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        //
        for view in profileSubViews {
            view.layer.borderWidth = 1
//            view.layer.borderColor = UIColor.gray.cgColor
            view.layer.borderColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func modifyAction(_ sender: UIButton) {
        
    }
}
