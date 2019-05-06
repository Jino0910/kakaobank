//
//  AppDetailSubHeaderCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailSubHeaderCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 60
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var contentAdvisoryRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: AppInfoModel) {
        
        self.ratingLabel.text = "\(model.averageUserRating)"
        self.ratingView.rating = Double(model.averageUserRating)
        self.reviewCountLabel.text = "\(model.userRatingCount.toHangulValue())개의 평가"
        
        self.rankLabel.text = "1"
        self.genresLabel.text = model.genresValue
        self.contentAdvisoryRatingLabel.text = model.contentAdvisoryRating
    }
}
