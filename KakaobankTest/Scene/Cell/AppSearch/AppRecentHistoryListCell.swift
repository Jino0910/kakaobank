//
//  AppRecentHistoryListCell.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit

class AppRecentHistoryListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = " "
    }
    
    func configure(model: SearchHistoryModel) {
        self.titleLabel.text = model.searchWord
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
