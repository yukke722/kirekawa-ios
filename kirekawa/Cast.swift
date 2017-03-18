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
    var shopId: Int = 0
    let name: String
    
    /* Constructor */
    init(data: JSON) {
        self.id = data["id"].int!
        if let shopId = data["shop"]["id"].int {
            self.shopId = shopId
        }
        self.name = data["name"].string!
//        print("castInit: id:\(self.id), shopid: \(self.shopId)")
    }
}
