//
//  AppDetailHeaderCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppDetailHeaderCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 120
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downLoadButton: UIButton!
    @IBOutlet weak var inAppEnableLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: AppInfoModel) {
        
        self.titleLabel.text = model.trackName
        self.subTitleLabel.text = model.artistName
        
        self.iconImageView.asyncImageLoad(url: model.artworkUrl512, cachedName: model.artworkUrl512, handler: { (iv, image) in
            guard let image = image else { return }
            iv.image = image
        })
    }
}
