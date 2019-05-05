//
//  UIImageView+Extionsion.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func asyncImageLoad(url: String, cachedName: String, handler: @escaping ((_ imageView: UIImageView, _ image: UIImage?) -> Void)) {
        
        let imageCache = NSCache<NSString, UIImage>()
        
        if let cachedImage = imageCache.object(forKey: NSString(string: cachedName)) {
            handler(self, cachedImage)
        }
        else
        {
            DispatchQueue.global(qos: .background).async {
                guard let url = URL(string: url) else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: NSString(string: cachedName))
                    handler(self, image)
                }
            }
        }
    }
}
