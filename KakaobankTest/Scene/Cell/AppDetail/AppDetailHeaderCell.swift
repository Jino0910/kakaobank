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
import SafariServices


class AppDetailHeaderCell: UICollectionViewCell {
    
    private var disposeBag = DisposeBag()
    
    public static let cellHeight: CGFloat = 120
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downLoadButton: UIButton!
    @IBOutlet weak var inAppEnableLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    let actionTitles = ["앱 공유하기...", "이 개발자의 다른 앱 보기"]
    
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
        
        self.moreButton.rx.tap
            .throttle(1, latest: true, scheduler: MainScheduler.instance)
            .flatMap {
                UIAlertController.showAlert(title: nil,
                                            message: nil,
                                            style: .actionSheet,
                                            actions: self.actionTitles.map({ (title) -> AlertAction in
                                                AlertAction(title: title, image: #imageLiteral(resourceName: "user"), style: .default)
                                            }))
            }
            .subscribe(onNext: { (index) in
                switch index {
                case 0:
                    let vc = UIActivityViewController(activityItems: [model.shareMessage], applicationActivities: nil)
                    UIApplication.topViewController()?.present(vc, animated: true, completion: {})
                case 1:
                    guard let url = URL(string: model.artistViewUrl) else { return }
                    let vc = SFSafariViewController(url: url)
                    UIApplication.topViewController()?.present(vc, animated: true, completion: {})
                default: break
                }
            })
            .disposed(by: self.disposeBag)
    }
}
