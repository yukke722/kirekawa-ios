//
//  WebViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/27.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var btnDismiss: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    
    var url: String!
    var caption: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(caption!)")
        self.navBar.title = caption!
        
        /* TODO: url == nil時に戻す処理 */
        let pageUrl = NSURL(string: "\(Const.baseUrl)\(url!)")
        
        let requestUrl = NSURLRequest(url: pageUrl as! URL)
        webView.loadRequest(requestUrl as URLRequest)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissModal(_ sender: Any) {
        print("click!")
        dismiss(animated: true, completion: nil)
    }

}
