//
//  AppSearchHistoryListCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppSearchHistoryListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: RecentHistoryModel, type: AppSearchSectionType, status: AppSearchStatus) {
        
        self.textLabel?.text = model.searchWord
        
        switch type {
        case .recentWordTitle:
            self.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            self.textLabel?.textColor = .black
        default:
            self.textLabel?.font = UIFont.systemFont(ofSize: 22)
            
            switch status {
            case .searchBefore:
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
