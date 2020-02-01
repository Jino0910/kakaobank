//
//  AppItemCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Cosmos

class AppItemCell: UITableViewCell {
    
    private var disposeBag = DisposeBag()
    
    private let screenShotHeight: CGFloat = 180.0
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downLoadButton: UIButton!
    @IBOutlet weak var inAppEnableLabel: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    @IBOutlet weak var screenShotImageView1: UIImageView!
    @IBOutlet weak var screenShotImageView2: UIImageView!
    @IBOutlet weak var screenShotImageView3: UIImageView!
    
    @IBOutlet weak var screenShotWidth: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = nil
        self.titleLabel.text = " "
        self.subTitleLabel.text = " "
        self.screenShotImageView1.image = nil
        self.screenShotImageView2.image = nil
        self.screenShotImageView3.image = nil
        self.ratingView.rating = 0
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: AppInfoModel) {
        
        self.titleLabel.text = model.trackName
        self.subTitleLabel.text = model.artistName
        
        self.ratingView.rating = Double(model.averageUserRating)
        self.reviewCountLabel.text = model.userRatingCount.toHangulValue()
        
        self.iconImageView.rx_asyncImageLoad(url: model.artworkUrl512, cachedName: model.artworkUrl512).subscribe().dispose()
        
        guard model.screenshotUrls.count != 0 else { return }
        
        var imageViews: [UIImageView] = []
        var screenShots: [String] = []
        
        switch model.screenshotUrls.count {
        case 1:
            self.screenShotImageView2.isHidden = true
            self.screenShotImageView3.isHidden = true
            imageViews = [self.screenShotImageView1]
            screenShots = [model.screenshotUrls[0].stringValue]
        case 2:
            self.screenShotImageView2.isHidden = false
            self.screenShotImageView3.isHidden = true
            imageViews = [self.screenShotImageView1, self.screenShotImageView2]
            screenShots = [model.screenshotUrls[0].stringValue, model.screenshotUrls[1].stringValue]
        default:
            self.screenShotImageView2.isHidden = false
            self.screenShotImageView3.isHidden = false
            imageViews = [self.screenShotImageView1, self.screenShotImageView2, self.screenShotImageView3]
            screenShots = [model.screenshotUrls[0].stringValue, model.screenshotUrls[1].stringValue, model.screenshotUrls[2].stringValue]
        }

        loadScreenShot(imageViews: imageViews, url: screenShots)
    }
    
    private func loadScreenShot(imageViews: [UIImageView], url: [String]) {

        for (index, imageView) in imageViews.enumerated() {
            
            imageView.rx_asyncImageLoad(url: url[index], cachedName: url[index])
                .subscribe(onSuccess: { [weak self](_, image: UIImage?) in
                    guard let self = self else { return }
                    guard let image = image else { return }
                    self.screenShotWidth.constant = self.screenShotHeight * image.size.width / image.size.height

                })
                .disposed(by: disposeBag)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
