//
//  AppSearchBaseItem.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation
import RxDataSources
import SwiftyJSON

enum AppSearchSectionType {
    
    // 최근검색어
    case recentWordTitle
    case recentWordContent
    // 앱검색
    case searchWordList
    case searchAppInfoList
    // 앱상세
    case detailHeader
    case detailSubHeader
    case detailScreenShot
    case detailDescription
    case detailDeveloperInfo
    case detailRating
    case detailReviews
    case detailNewFeatureVersion
    case detailNewFeatureDescription
    case detailInformationTitle
    case detailInformationContent
}

struct AppSearchBaseItemSection {
    var items: [AppSearchBaseItem]
}
extension AppSearchBaseItemSection: SectionModelType {
    typealias Item = AppSearchBaseItem
    
    init(original: AppSearchBaseItemSection, items: [Item]) {
        self = original
        self.items = items
    }
}

struct AppSearchBaseItem {
    
    let type: AppSearchSectionType
    let object: Any
    
    init(type: AppSearchSectionType, object: Any) {
        self.type = type
        self.object = object
    }
}
