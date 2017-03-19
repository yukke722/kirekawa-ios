//
//  CastTableViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/05.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import BTNavigationDropdownMenu


class CastTableViewController: UITableViewController {
    var menuView: BTNavigationDropdownMenu!

    var casts = [Cast]()
    var cast: Cast?
    var jobType = [String](Const.jobTypes.keys)[0]

    override func viewDidLoad() {
        super.viewDidLoad()
        setMenuView()

        callApiGetCasts(jobType: jobType);
        
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
        return casts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath)

        cell.textLabel?.text = "id: \(casts[indexPath.row].id) / " + casts[indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cast = casts[indexPath.row]
        if cast != nil {
            self.performSegue(withIdentifier: "castSelect", sender: nil)
        }
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "castSelect") {
            let castDVC: CastDetailViewController = (segue.destination as? CastDetailViewController)!
            castDVC.cast = cast!
        }
    }
    
    func callApiGetCasts(jobType: String) {
        
        // APIへ接続するための設定
        let url = "http://night.kire-kawa.com/api/front/api2"
        let params = ["job_type": jobType]
        self.casts = [Cast]()
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON{ response in
            let json = JSON(response.result.value!)
            json["users"].forEach{(_, data) in
                self.casts.append(Cast.init(data: data))
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
            self?.callApiGetCasts(jobType: (self?.jobType)!);
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
