//
//  AppSearchMainListCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppSearchMainListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: RecentHitoryModel, type: AppSearchSectionType, status: AppSearchStatus) {
        
        self.textLabel?.text = model.searchWord
        
        switch type {
        case .recentWordTitle:
            self.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            self.textLabel?.textColor = .black
        default:
            self.textLabel?.font = UIFont.systemFont(ofSize: 22)
            
            switch status {
            case .searchNon:
                self.textLabel?.textColor = .appleBlue
            default:
                self.textLabel?.textColor = .darkGray
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
