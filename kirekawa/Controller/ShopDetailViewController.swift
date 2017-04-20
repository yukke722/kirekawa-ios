//
//  ShopDetailViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ShopDetailViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationItem!

    
    var shop: Shop!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = shop.name
        
//        callApiGetShopDetail();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    func callApiGetShopDetail() {
//        print("callApiGetShopDetail")
//        
//        let url = "http://night.kire-kawa.com/api/front/api4"
//        let params = ["id": shopId!]
//        
//        Alamofire.request(url, method: .get, parameters: params).responseJSON{ response in
//            let json = JSON(response.result.value!)
//            json["shops"].forEach{(_, data) in
//                let id = data["id"].int!
//                let name = data["name"].string!
//                let tel = data["tel"].string!
//                self.shop = ShopDetail(id: id, name: name, tel: tel)
//            }
//            
//        }
//        
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
