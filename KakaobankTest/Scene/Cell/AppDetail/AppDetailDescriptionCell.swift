//
//  AppDetailDescriptionCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppDetailDescriptionCell: UICollectionViewCell {
    
    private var disposeBag = DisposeBag()
    
    private let leftRightMargin: CGFloat = 40.0
    private let topBottomMargin: CGFloat = 40.0
    private let defaultHeight: CGFloat = 56.0
    
    var handler : (() -> Void)?
    private var isOpened: Bool = false
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.rx.tapGesture()
            .skip(1)
            .filter({_ in !self.isOpened })
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.isOpened = true
                self.moreLabel.isHidden = self.isOpened
                self.descriptionLabel.numberOfLines = 0
                self.handler?()
            }).disposed(by: disposeBag)
    }
    
    func configure(model: AppInfoModel) {
        
        if isOpened {
            self.descriptionLabel.text = model.description
        } else {
            self.descriptionLabel.text = model.descriptionTrimVer
        }
    }
    
    public func cellHeight(width: CGFloat, desc: String) -> CGFloat {
       
        if isOpened {
            let attribute = desc.setAttributedString(font: UIFont.systemFont(ofSize: 15.0))
            self.descriptionLabel.attributedText = attribute
            
            return attribute.height(width: width-leftRightMargin) + topBottomMargin
        } else {
            return defaultHeight + topBottomMargin
        }
    }
    
    public static func cellHeight() -> CGFloat {
        return 96
    }
}
