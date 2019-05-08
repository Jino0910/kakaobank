//
//  AppDetailHeaderCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AppDetailHeaderCell: UICollectionViewCell {
    
    private var disposeBag = DisposeBag()
    
    public static let cellHeight: CGFloat = 120
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downLoadButton: UIButton!
    @IBOutlet weak var inAppEnableLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: AppInfoModel) {
        
        self.titleLabel.text = model.trackName
        self.subTitleLabel.text = model.artistName
        
        self.iconImageView.rx_asyncImageLoad(url: model.artworkUrl512, cachedName: model.artworkUrl512)
            .subscribe(onSuccess: { (iv: UIImageView, image: UIImage?) in
                guard let image = image else { return }
                iv.image = image
            })
            .disposed(by: disposeBag)
    }
}
