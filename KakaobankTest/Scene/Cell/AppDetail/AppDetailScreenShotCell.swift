

//
//  AppDetailScreenShotCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppDetailScreenShotCell: UICollectionViewCell, ScrollViewCustomHorizontalPageSize {
    
    @IBOutlet weak var sc: UIScrollView!
    
    var handler : ((_ height: CGFloat) -> Void)?
    
    private let screenShotWidth: CGFloat = 240.0
    private let screenShotMargin: CGFloat = 10.0
    public static let bottomMargin: CGFloat = 50.0
    private var isResize: Bool = false
    
    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var iv2: UIImageView!
    @IBOutlet weak var iv3: UIImageView!
    @IBOutlet weak var iv4: UIImageView!
    @IBOutlet weak var iv5: UIImageView!
    @IBOutlet weak var iv6: UIImageView!
    @IBOutlet weak var iv7: UIImageView!
    @IBOutlet weak var iv8: UIImageView!
    @IBOutlet weak var iv9: UIImageView!
    @IBOutlet weak var iv10: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        handler = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sc.delegate = self
    }
    
    func configure(model: AppInfoModel) {
        
        let ivs = [iv1, iv2, iv3, iv4, iv5, iv6, iv7, iv8, iv9, iv10]
        
        for (index, iv) in ivs.enumerated() {
            
            if model.screenshotUrls.count > index {
                
                guard let url = model.screenshotUrls[index].string else { return }
                
                iv?.asyncImageLoad(url: url, cachedName: url, handler: { (iv, image) in
                    guard let image = image else { return }
                    iv.image = image
                    
                    guard self.isResize == false else { return }
                    self.isResize = true
                    self.handler?((self.screenShotWidth) * image.size.height / image.size.width)
                })
                
            } else {
                iv?.removeFromSuperview()
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
