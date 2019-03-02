//
//  Store.swift
//  team2z
//
//  Created by 정인호 on 02/03/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import Foundation

class Store {
    var id: Int
    var name: String
    var address: String
    var phone: String
    var rating: Int
    var spicyType: Int
    var spicyText: String
    var ddukType: Int
    var ddukText: String
    
    init(id: Int, name: String, address: String, phone: String, rating: Int, spicyType: Int, spicyText: String, ddukType: Int, ddukText: String) {
        self.id = id
        self.name = name
        self.address = address
        self.phone = phone
        self.rating = rating
        self.spicyType = spicyType
        self.spicyText = spicyText
        self.ddukType = ddukType
        self.ddukText = ddukText
    }
    
    
    
}
