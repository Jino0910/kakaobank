//
//  SearchHistoryRealmItem.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation
import RealmSwift

/// Realm Object
class SearchHistoryRealmItem: Object {
    
    @objc dynamic var searchWord: String = ""
    @objc dynamic var date: Date = Date()
}
