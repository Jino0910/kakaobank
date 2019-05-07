//
//  AppDetailNewFeatureDescriptionCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Async

class AppDetailNewFeatureDescriptionCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    private var disposeBag = DisposeBag()
    
    private let leftRightMargin: CGFloat = 40.0
    private let topBottomMargin: CGFloat = 30.0
    private let defaultHeight: CGFloat = 56.0
    
    var handler : (() -> Void)?
    private var isOpened = false
    private var isMoreInfo = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.rx.tapGesture()
            .skip(1)
            .filter({_ in self.isMoreInfo && !self.isOpened })
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.isOpened = true
                self.moreLabel.isHidden = self.isOpened
                self.descriptionLabel.numberOfLines = 0
                self.handler?()
            }).disposed(by: disposeBag)
    }
    
    func configure(model: AppInfoModel) {
        
        let height = self.getDescriptionNSAttributeString(description: model.description).height(width: UIScreen.main.bounds.width-leftRightMargin)
        
        self.getMoreDescription(height: height)

        if self.isMoreInfo {
            self.descriptionLabel.text = model.releaseNotesTrimVer
        } else {
            self.descriptionLabel.text = model.releaseNotes
        }
        
        self.moreLabel.isHidden = !self.isMoreInfo
        
        
        Async.main(after: 0.1) { self.handler?() }
    }
    
    public func cellHeight(width: CGFloat, desc: String) -> CGFloat {
      
        if self.isMoreInfo {

            if isOpened {
                
                let attribute = self.getDescriptionNSAttributeString(description: desc)
                
                self.descriptionLabel.attributedText = attribute
                
                return attribute.height(width: width-leftRightMargin) + topBottomMargin
            } else {
                return defaultHeight + topBottomMargin
            }
            
        } else {
            
            let attribute = self.getDescriptionNSAttributeString(description: desc)
            
            return attribute.height(width: width-leftRightMargin) + topBottomMargin
        }
    }
    
    public static func cellHeight() -> CGFloat {
        return 86
    }
}

extension AppDetailNewFeatureDescriptionCell {
    
    private func getDescriptionNSAttributeString(description: String) -> NSAttributedString {
        
        return NSAttributedString(string: description, attributes: [
            .font: UIFont.systemFont(ofSize: 15.0)
            ])
    }
    
    private func getMoreDescription(height: CGFloat) {
        self.isMoreInfo = height > 60
    }
}
