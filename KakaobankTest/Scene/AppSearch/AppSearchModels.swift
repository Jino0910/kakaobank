//
//  AppSearchModels.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright (c) 2019 rowkaxl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxDataSources
import SwiftyJSON

enum AppSearch {
    // MARK: Use cases
    
    enum RecentHitory {
        struct Request {
            
        }
        struct Response {
            var recentHistoryModels: [RecentHistoryModel]
        }
        struct ViewModel {
            var sectionModels: [AppSearchBaseItemSection]
        }
    }
    
    enum SearchWordHitory {
        struct Request {
            var query: String
        }
        struct Response {
            var searchHistoryModel: [SearchHistoryModel]
        }
        struct ViewModel {
            var sectionModels: [AppSearchBaseItemSection]
        }
    }
    
    enum SearchAppStore {
        struct Request {
            var query: String
        }
        struct Response {
            var json: JSON
            var appInfoModels: [AppInfoModel]
        }
        struct ViewModel {
            var sectionModels: [AppSearchBaseItemSection]
        }
    }
}

struct RecentHistoryModel {
    
    /// 검색어
    var searchWord: String?
    /// 시간
    var date: Date?
    
    init(searchWord: String, date: Date) {
        self.searchWord = searchWord
        self.date = date
    }
}

struct SearchHistoryModel {
    
    /// 검색어
    var searchWord: String?
    /// 시간
    var date: Date?
    
    init(searchWord: String, date: Date) {
        self.searchWord = searchWord
        self.date = date
    }
}

enum AppSearchStatus {
    /// 검색전
    case searchBefore
    /// 검색시작(키워드x)
    case searchStart
    /// 검색중(키워드o)
    case searching
    /// 검색완료(앱정보화면)
    case searchComplete
}

extension AppSearchStatus {
    
    var dimViewAlpha: CGFloat {
        
        switch self {
        case .searchBefore: return 0.0
        case .searchStart: return 0.4
        case .searching, .searchComplete: return 1.0
        }
    }

    var dimViewBackgroundColor: UIColor {
        
        switch self {
        case .searchBefore: return .black
        case .searchStart: return .black
        case .searching, .searchComplete: return .white
        }
    }
    
    var serchTvAlpha: CGFloat {
        
        switch self {
        case .searchBefore: return 0.0
        case .searchStart: return 0.0
        case .searching, .searchComplete: return 1.0
        }
    }
}
