//
//  UINavigationBar+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 09/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func hideBottomLine() {
        
        self.barTintColor = UIColor.white
        self.isTranslucent = false
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
    
    func showBottomLine() {
        
        self.barTintColor = UIColor.white
        self.isTranslucent = false
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}
