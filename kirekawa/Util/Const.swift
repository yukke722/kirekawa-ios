//
//  Const.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import Foundation

struct Const {
    static let kKirekawa = "キレカワ"
    static let baseUrl = "http://night.kire-kawa.com/"
    static let settingPaths:
        [String : String] = ["利用規約" : "terms",
                             "プライバシーポリシー" : "policy",
                             "お問い合わせ" : "contact"
    ]
    
    static let jobTypes:
        [String : String] = ["karaoke" : "カラオケ",
                             "bar" : "バー",
                             "massage" : "マッサージ"]

}
