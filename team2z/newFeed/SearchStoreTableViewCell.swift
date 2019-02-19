//
//  SearchStoreTableViewCell.swift
//  team2z
//
//  Created by MOONJUNG on 18/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class SearchStoreTableViewCell: UITableViewCell {
    
    var storeName = UILabel()
    var storeAddress = UILabel()
    var starImage = UIImageView()
    var storeScore = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(storeName)
        self.contentView.addSubview(storeAddress)
        self.contentView.addSubview(starImage)
        self.contentView.addSubview(storeScore)
        snapKitLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func snapKitLayout(){
        self.storeName.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.contentView).offset(15)
            self.storeName.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        self.storeAddress.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.storeName).offset(20)
            self.storeAddress.font = UIFont.systemFont(ofSize: 13.0)
        }
        self.starImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.storeAddress).offset(20)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        self.storeScore.snp.makeConstraints { (make) in
            make.left.equalTo(self.starImage).offset(20)
            make.top.equalTo(self.storeAddress).offset(20)
            self.storeScore.font = UIFont.systemFont(ofSize: 13.0)
        }
        
    }
    

}
