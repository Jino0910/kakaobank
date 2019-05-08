//
//  AppDetailInformationContentCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppDetailInformationContentCell: UICollectionViewCell {
    
    public static let cellHeight: CGFloat = 50
    public var type: AppDetailInformationContent?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cotentLabel: UILabel!
    
    
    func configure(model: AppInfoModel, type: AppDetailInformationContent) {
        
        self.titleLabel.text = type.title
        self.titleLabel.textColor = type.titleColor
        
        switch type {
        case .sellerName: self.cotentLabel.text = model.sellerName
        case .fileSize: self.cotentLabel.text = model.fileSizeMegaBytes
        case .category: self.cotentLabel.text = model.genresValue
        case .supportedDevices: self.cotentLabel.text = ""
        case .languageCodesISO2A: self.cotentLabel.text = model.languageCodesISO2A
        case .contentAdvisoryRating: self.cotentLabel.text = model.contentAdvisoryRating
        case .copyRight: self.cotentLabel.text = "Copyright " + model.sellerName
        case .developerWebsite: self.cotentLabel.text = ""
        case .privacyPolicy: self.cotentLabel.text = ""
        }

        self.type = type
    }
}
