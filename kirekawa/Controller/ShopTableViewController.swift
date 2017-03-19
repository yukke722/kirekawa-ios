//
//  ShopTableViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import BTNavigationDropdownMenu


class ShopTableViewController: UITableViewController {
    var menuView: BTNavigationDropdownMenu!
    
    var shops = [Shop]()
    var shop: Shop?
    var jobType = [String](Const.jobTypes.keys)[0]

    override func viewDidLoad() {
        super.viewDidLoad()

        setMenuView()
        callApiGetShops(jobType: jobType);

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath)

        cell.textLabel?.text = "id: \(shops[indexPath.row].id) / " + shops[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shop = self.shops[indexPath.row]
        
        if shop != nil {
            self.performSegue(withIdentifier: "shopSelect", sender: nil)
        }
    }

    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "shopSelect") {
            let shopDVC: ShopDetailViewController = (segue.destination as? ShopDetailViewController)!
            shopDVC.shop = shop!
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    func callApiGetShops(jobType: String) {
        
        // APIへ接続するための設定
        let url = "http://night.kire-kawa.com/api/front/api12"
        let params = ["job_type": jobType]
        self.shops = [Shop]()
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON{ response in
            let json = JSON(response.result.value!)
            json["shops"].forEach{(_, data) in
                self.shops.append(Shop.init(data: data))
            }
            self.tableView.reloadData()
        }
        
    }
    
    /* setMenuView */
    func setMenuView() {
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: [String](Const.jobTypes.values)[0], items: [String](Const.jobTypes.values) as [AnyObject])
        self.navigationItem.titleView = menuView
        
//        menuView.arrowImage = ""
        menuView.arrowPadding = 15
        menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            self?.jobType = [String](Const.jobTypes.keys)[indexPath]
            self?.title = [String](Const.jobTypes.values)[indexPath]
            self?.callApiGetShops(jobType: (self?.jobType)!);
        }
    }
    
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
