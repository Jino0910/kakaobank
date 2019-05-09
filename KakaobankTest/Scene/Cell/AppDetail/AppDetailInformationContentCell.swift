//
//  AppDetailInformationContentCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppDetailInformationContentCell: UICollectionViewCell {
    
    private var disposeBag = DisposeBag()
    
    public var type: AppDetailInformationContent?
    
    private let defaultTitleWidth: CGFloat = 120.0
    private let leftRightMargin: CGFloat = 40.0
    private let topBottomMargin: CGFloat = 40.0
    private let padding: CGFloat = 10.0
    private let defaultCellHeight: CGFloat = 50.0
    
    var handler : (() -> Void)?
    private var isOpened: Bool = false
    private var isMoreInfo: Bool = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cotentLabel: UILabel!
    @IBOutlet weak var longCotentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        contentView.rx.tapGesture()
//            .skip(1)
//            .filter({_ in self.isMoreInfo && !self.isOpened })
//            .subscribe(onNext: { [weak self](_) in
//                guard let self = self else { return }
//                self.isOpened = true
//                self.cotentLabel.isHidden = self.isOpened
//                self.longCotentLabel.isHidden = !self.isOpened
//                self.handler?()
//            }).disposed(by: disposeBag)
    }
    
    
    func configure(model: AppInfoModel, type: AppDetailInformationContent) {
        
        self.titleLabel.text = type.title
        self.titleLabel.textColor = type.titleColor
        
        let content = model.informationContent(type: type)
        
        self.cotentLabel.text = content
        self.longCotentLabel.text = content

        self.type = type
        
//        let height = content.setAttributedString(font: UIFont.systemFont(ofSize: 15.0)).height(width: UIScreen.main.bounds.width-defaultTitleWidth-leftRightMargin-padding)
//
//        self.getMoreDescription(height: height)
//
//        if self.isMoreInfo {
//            self.cotentLabel.isHidden = self.isOpened
//            self.longCotentLabel.isHidden = !self.isOpened
//        } else {
//            self.cotentLabel.isHidden = self.isMoreInfo
//            self.longCotentLabel.isHidden = !self.isMoreInfo
//        }
    }
    
//    public func cellHeight(width: CGFloat, desc: String) -> CGFloat {
//
//        if self.isMoreInfo {
//            if isOpened {
//                let attribute = desc.setAttributedString(font: UIFont.systemFont(ofSize: 15.0))
//                return attribute.height(width: width-defaultTitleWidth-leftRightMargin-padding) + topBottomMargin + padding + 18
//            } else {
//                return defaultCellHeight
//            }
//        } else {
//            return defaultCellHeight
//        }
//    }
    
    public static func cellHeight() -> CGFloat {
        return 50
    }
}

//extension AppDetailInformationContentCell {
//    
//    private func getMoreDescription(height: CGFloat) {
//        self.isMoreInfo = height > 20
//    }
//}
