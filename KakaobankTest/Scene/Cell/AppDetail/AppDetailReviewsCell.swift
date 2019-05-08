//
//  AppDetailReviewsCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import SnapKit

class AppDetailReviewsCell: UICollectionViewCell, ScrollViewCustomHorizontalPageSize {
    
    public static let cellHeight: CGFloat = 190.0

    private let screenShotMargin: CGFloat = 10.0
    private let leftRightMargin: CGFloat = 40.0
    private let reviewCount = 5
    
    @IBOutlet weak var sc: UIScrollView!
    
    @IBOutlet weak var scViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sc.delegate = self
        
        self.sc.contentSize = CGSize(width: (UIScreen.main.bounds.width - leftRightMargin) * CGFloat(reviewCount) + screenShotMargin * (CGFloat(reviewCount) - 1) + leftRightMargin, height: AppDetailReviewsCell.cellHeight)
        
        self.scViewWidth.constant = self.sc.contentSize.width
        
        var beforeView: UIView?
        
        for _ in 1...reviewCount {
            
            let view = UIView(frame: .zero)
            view.backgroundColor = .borderColor
            view.cornerRadius = 5
            view.clipsToBounds = true
            sc.addSubview(view)
            
            view.snp.makeConstraints { (make) in

                if let beforeView = beforeView {
                    make.top.equalTo(beforeView.snp.top)
                    make.leading.equalTo(beforeView.snp.trailing).offset(screenShotMargin)
                    make.width.equalTo(beforeView.snp.width)
                    make.height.equalTo(beforeView.snp.height)
                    make.bottom.equalTo(beforeView.snp.bottom)
                } else {
                    make.top.equalTo(sc.snp.top)
                    make.leading.equalTo(leftRightMargin/2)
                    make.width.equalTo(UIScreen.main.bounds.width - leftRightMargin)
                    make.height.equalTo(sc.snp.height)
                    make.bottom.equalTo(sc.snp.bottom)
                }

                beforeView = view
            }
        }
    }
    
    var pageSize: CGFloat {
        return UIScreen.main.bounds.width - leftRightMargin + screenShotMargin
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee.x = getTargetContentOffset(scrollView: scrollView, velocity: velocity)
    }
}
