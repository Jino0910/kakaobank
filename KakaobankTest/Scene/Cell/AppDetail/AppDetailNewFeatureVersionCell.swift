//
//  AppDetailNewFeatureVersionCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
//import AFDateHelper

class AppDetailNewFeatureVersionCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 60
    
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    func configure(model: AppInfoModel) {
        
        self.versionLabel.text = "버전 \(model.version)"
//        self.lastUpdateLabel.text = model.currentVersionReleaseDate
//        self.lastUpdateLabel.text =dateString.toDate(format: "yyyyMMdd")
        
//        offsetFrom
//            model.currentVersionReleaseDate
    }
}
