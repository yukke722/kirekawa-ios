//
//  Shop.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/15.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//


import Foundation
import SwiftyJSON

class Shop {
    let id: Int
    let name: String
    let pictureUrl: String
    let tel: String
    let score: String
    let access: String
    
    /* Constructor */
    init(data: JSON) {
        self.id = data["id"].int!
        self.name = String(describing: data["name"])
        self.tel = String(describing: data["tel"])
        self.pictureUrl = String(describing: data["images"][0]["url"])
        self.score = String(describing: data["total_score"])
        self.access = String(describing: data["access"])
    }
    
}
