//
//  ViewController.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/03/02.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var header: UINavigationBar!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var isRedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 一度同意したら次から表示しない */
        if ((userDefaults.object(forKey: "isRedAboutKirekawa")) != nil) {
            print("intent next page")
        }
        
        desc.text = "\(Const.kKirekawa)"

        /* btn 
         * コードで書くか、storyboardで書くか
         * storyboardだと、ボタンのデザインを統一する時に面倒
         */
        btn.backgroundColor = UIColor.gray
        btn.layer.masksToBounds = true
        btn.setTitle("説明文読んだよ", for: UIControlState.normal)
        btn.layer.cornerRadius = 20.0
        btn.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        btn.isUserInteractionEnabled = false
        
        
        /* switch 
         * switchをonにした時、descの名用を変更
         */
        isRedSwitch.isOn = false
        isRedSwitch.layer.position = CGPoint(
            x: self.view.frame.width/2,
            y: 300
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        /* ページ遷移はstoryboardで記述 */
        userDefaults.set(true, forKey: "isRedAboutKirekawa")
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        print(isRedSwitch.isOn)
        
        if (isRedSwitch.isOn) {
            desc.text = "キレカワに同意しました"
            btn.isUserInteractionEnabled = true
            btn.backgroundColor = UIColor.yellow
        } else {
            desc.text = "キレカワに同意しません"
            btn.isUserInteractionEnabled = false
            btn.backgroundColor = UIColor.gray
        }
    }
    
}

