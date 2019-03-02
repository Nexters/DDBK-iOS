//
//  ResultStoreTableViewCell.swift
//  team2z
//
//  Created by MOONJUNG on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class ResultStoreTableViewCell: UITableViewCell {

    var storeName = UILabel()
    var storeAddress = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(storeName)
        self.contentView.addSubview(storeAddress)
        snapKitLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func snapKitLayout(){
        self.storeName.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.contentView).offset(10)
            self.storeName.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        self.storeAddress.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.storeName).offset(20)
            self.storeAddress.font = UIFont.systemFont(ofSize: 13.0)
        }
    }
    

}
