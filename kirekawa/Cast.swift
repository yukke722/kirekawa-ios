//
//  Cast.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/15.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cast {
    let id: Int
    let name: String
    let nickName: String
    let age: String
    let pictureUrl: String
    let shopId: Int
    let shopName: String
    
    /* Constructor */
    init(data: JSON) {
        self.id = data["id"].int!
        self.name = String(describing: data["name"])
        self.nickName = String(describing: data["nick_name"])
        self.age = String(describing: data["age"]) 
        self.pictureUrl = String(describing: data["images"][0]["url"])
        self.shopId = data["shop"]["id"].int ?? 0
        self.shopName = String(describing: data["shop"]["name"])
    }
    
}
