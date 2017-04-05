//
//  ShopCell.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/04/01.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//

import UIKit

class ShopCell: UITableViewCell {
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var access: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
