//
//  AppDetailRatingCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppDetailRatingCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 155
    
    @IBOutlet weak var ratingTrailing3: NSLayoutConstraint!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewsButton: UIButton!
    
    private var disposeBag = DisposeBag()
    
    func configure(model: AppInfoModel) {
        
        self.ratingLabel.text = "\(model.averageUserRating)"
        self.reviewCountLabel.text = model.userRatingCount.formattedWithSeparator + "개의 평가"
    }
}
