//
//  CastDetailViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CastDetailViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var btnToShop: UIButton!

    var cast: Cast!
    var shop: Shop!
    var keepAlive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /* shopIdが無い時 */
        if cast.shopId == 0 {
            btnToShop.isHidden = true
        } else {
            callApiGetShopDetail()
            btnToShop.setTitle(shop.name, for: UIControlState.normal)
        }
        navBar.title = cast.name
        lblId.text = "\(cast.id)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        func callApiGetShopDetail() {
    
            let url = "http://night.kire-kawa.com/api/front/api4"
            let params = ["id": cast.shopId]
    
            Alamofire.request(url, method: .get, parameters: params).responseJSON{ response in
                
                let json = JSON(response.result.value!)
                self.shop = Shop.init(data: json["shop"])
                self.keepAlive = false
            }
            
            let runLoop = RunLoop.current
            while self.keepAlive &&
                runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) {
                    // 0.1秒毎の処理なので、処理が止まらない
                    print("Loading...")
            }
        }
    


//    @IBAction func toShop(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "shopSelect", sender: nil)
//    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toShopDetail") {
            let shopDVC: ShopDetailViewController = (segue.destination as? ShopDetailViewController)!
            shopDVC.shop = self.shop
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
