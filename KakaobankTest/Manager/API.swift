//
//  API.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

enum Kakao {
    
    /// 앱스토어 검색
    case searchAppStore(query: String)
}

extension Kakao {
    
    // base url
    var baseURL: URL {
        return URL(string: "http://itunes.apple.com/search?")!
    }
    
    // path
    var path: String {
        
        switch self {
        case .searchAppStore(let query):
            /*
             term : 검색어
             country : 스토어의 국가계정, 기본값은 US
             media : 미디어의 타입, 종류는 movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all 기본값은 all
             limit : 받을 갯수설정, 기본값은 50
            */
            return "country=kr&media=software&term=\(query)" // &limit=
        }
    }
    
    // method
    var method: HTTPMethod {
        switch self {
        case .searchAppStore:
            return .get
        }
    }
    
    // headers
    var headers: [String: String]? {
        var headers: [String: String] = [:]
        headers["Accept-Encoding"] = "gzip, deflate"
        headers["Content-Encoding"] = "gzip"
        return headers
    }
    
    // paramaters
    var paramaters: [String: Any] {
        switch self {
        default: return [:]
        }
    }
}

public enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum HttpResponseCode: String {
    case code200 = "200"
    case code400 = "400"
    case unknown = "9999"
}

enum NetworkError: Error {
    case networkError
    case jsonParseError
    case noDataError
}

