

//
//  AppDetailScreenShotCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AppDetailScreenShotCell: UICollectionViewCell, ScrollViewCustomHorizontalPageSize {
    
    private var disposeBag = DisposeBag()
    
    private let screenShotWidth: CGFloat = 240.0
    private let screenShotMargin: CGFloat = 10.0
    public static let bottomMargin: CGFloat = 50.0
    
    var handler : ((_ height: CGFloat) -> Void)?
    private var isResize: Bool = false
    
    @IBOutlet weak var sc: UIScrollView!
    
    @IBOutlet var imageViews: [UIImageView]!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        handler = nil
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sc.delegate = self
    }
    
    func configure(model: AppInfoModel) {
        
        for (index, iv) in imageViews.enumerated() {
            
            if model.screenshotUrls.count > index {
                
                guard let url = model.screenshotUrls[index].string else { return }
                
                iv.rx_asyncImageLoad(url: url, cachedName: url)
                    .subscribe(onSuccess: { [weak self](iv: UIImageView, image: UIImage?) in
                        guard let self = self else { return }
                        guard let image = image else { return }
                        
                        guard self.isResize == false else { return }
                        self.isResize = true
                        self.handler?((self.screenShotWidth) * image.size.height / image.size.width)
                    })
                    .disposed(by: disposeBag)
                
            } else {
                iv.removeFromSuperview()
            }
        }
    }
    
    var pageSize: CGFloat {
        return screenShotWidth + screenShotMargin
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee.x = getTargetContentOffset(scrollView: scrollView, velocity: velocity)
    }

}
