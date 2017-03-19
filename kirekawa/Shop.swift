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
    let tel: String
    
    /* Constructor */
    init(data: JSON) {
        self.id = data["id"].int!
        self.name = data["name"].string!
        self.tel = data["tel"].string!
    }
    
    
}
