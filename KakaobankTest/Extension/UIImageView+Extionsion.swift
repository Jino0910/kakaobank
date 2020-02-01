//
//  UIImageView+Extionsion.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

typealias imageAsyncType = (iv: UIImageView, image: UIImage?)

extension UIImageView {
    
    func rx_asyncImageLoad(url: String, cachedName: String) -> PrimitiveSequence<SingleTrait, imageAsyncType> {
        
        return Single.create(subscribe: { (single) -> Disposable in
            
            let imageCache = NSCache<NSString, UIImage>()
            
            if let cachedImage = imageCache.object(forKey: NSString(string: cachedName)) {
                single(.success((self, cachedImage)))
            }
            else
            {
                DispatchQueue.global(qos: .background).async {
                    guard let url = URL(string: url) else { return }
                    guard let data = try? Data(contentsOf: url) else { return }
                    guard let image = UIImage(data: data) else { return  }
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: NSString(string: cachedName))
                        self.image = image
                        single(.success((self, image)))
                    }
                }
            }
            
             return Disposables.create {}
        })
    }
}
