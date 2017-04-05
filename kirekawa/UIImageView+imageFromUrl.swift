//
//  UIImageView+imageFromUrl.swift
//  kirekawa
//
//  Created by 橋本 祐介 on 2017/04/02.
//  Copyright © 2017年 Yusuke Hashimoto. All rights reserved.
//
import UIKit

extension UIImageView {
    
    func imageFromUrl(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                 self.image = image
            }
            }.resume()
    }
    
    func imageFromUrl(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        imageFromUrl(url: url, contentMode: mode)
    }
    
    /* TODO: UIImageViewのサイズに合わせてUIImageをリサイズ */
}
