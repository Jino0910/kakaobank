//
//  RecentHistoryRealmItem.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

/// Realm Object
class RecentHistoryRealmItem: Object {
    
    @objc dynamic var searchWord: String = ""
    @objc dynamic var date: Date = Date()
}

