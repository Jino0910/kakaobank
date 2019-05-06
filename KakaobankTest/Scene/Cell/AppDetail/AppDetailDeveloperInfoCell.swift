//
//  AppDetailDeveloperInfoCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppDetailDeveloperInfoCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 60
    
    @IBOutlet weak var developerNameLabel: UILabel!
    
    func configure(model: AppInfoModel) {
        
        self.developerNameLabel.text = model.artistName
    }
}
