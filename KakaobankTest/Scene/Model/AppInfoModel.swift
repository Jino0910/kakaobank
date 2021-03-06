//
//  AppInfoModel.swift
//  KakaobankTest
//
//  Created by rowkaxl on 05/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AppInfoModel {
    
    var json: JSON = JSON()
    
    init(json: JSON = JSON()) {
        self.json = json
    }
    
    /// 앱명
    var trackName: String {
        return self.json["trackName"].stringValue
    }
    
    /// 평균 평점
    var averageUserRating: Float {
        return self.json["averageUserRating"].floatValue
    }
    
    /// 평가 총수
    var userRatingCount: Int {
        return self.json["userRatingCount"].intValue
    }
    
    /// 가격 한글
    var formattedPrice: String {
        return self.json["formattedPrice"].stringValue
    }
    
    /// 가격 금액
    var price: Float {
        return self.json["price"].floatValue
    }
    
    /// 아이폰 스크린샷
    var screenshotUrls: [JSON] {
        return self.json["screenshotUrls"].arrayValue
    }
    
    /// 아이패드 스크린샷
    var ipadScreenshotUrls: [JSON] {
        return self.json["ipadScreenshotUrls"].arrayValue
    }
    
    /// 애플워치 스크린샷
    var appletvScreenshotUrls: [JSON] {
        return self.json["appletvScreenshotUrls"].arrayValue
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    
    
    /// 앱설명
    var description: String {
        return self.json["description"].stringValue
    }
    
    /// 앱설명
    var descriptionTrimVer: String {
        return self.json["description"].stringValue.replace(target: "\n\n", withString: "\n")
    }
    
    /// 개발자 등록앱 URL
    var artistViewUrl: String {
        return self.json["artistViewUrl"].stringValue
    }

    
    ////////////////////////////////////////////////////////////////////////
    
    
    /// 버전
    var version: String {
        return self.json["version"].stringValue
    }
    
    /// 새로운 기능
    var releaseNotes: String {
        return self.json["releaseNotes"].stringValue
    }
    
    /// 새로운 기능
    var releaseNotesTrimVer: String {
        return self.json["releaseNotes"].stringValue.replace(target: "\n\n", withString: "\n")
    }
    
    /// 최신업데이트 날짜
    var currentVersionReleaseDate: String {
        return self.json["currentVersionReleaseDate"].stringValue
    }
    
    /// 최신업데이트  한글변환
    var currentVersionReleaseDateHangul: String {

        if let currentDate = self.json["currentVersionReleaseDate"].stringValue.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            return Date().offset(from: currentDate)
        } else {
            return self.json["currentVersionReleaseDate"].stringValue
        }
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    
    
    /// 판매자
    var sellerName: String {
        return self.json["sellerName"].stringValue
    }
    
    /// 크기
    var fileSizeBytes: String {
        return self.json["fileSizeBytes"].stringValue
    }
    
    /// 메가바이트 변환
    var fileSizeMegaBytes: String {
        
        if let bytes = Float(self.json["fileSizeBytes"].stringValue) {
            return "\(round(bytes / 1024.0 / 1024.0 * 10) / 10)MB"
        } else {
            return ""
        }
    }
    
    /// 카테고리 영어
    var primaryGenreName: String {
        return self.json["primaryGenreName"].stringValue
    }
    
    /// 카테고리 한글
    var genres: [JSON] {
        return self.json["genres"].arrayValue
    }
    
    /// 첫번째 카테고리 한글
    var genresValue: String {
        
        if self.json["genres"].arrayValue.count > 0 {
            return self.json["genres"].arrayValue[0].string ?? ""
        }
        return ""
    }
    
    /// 지원가능 디바이스
    var supportedDevices: [JSON] {
        return self.json["supportedDevices"].arrayValue
    }
    
    /// 호환성
    var compatibility: String {
        
        
        let iPhoneName = "iPhone"
        let iPadName = "iPad"
        let iPodName = "iPod touch"
        
        var iPhone = false
        var iPad = false
        var iPod = false
        
        for value in self.json["supportedDevices"].arrayValue {
            
            if iPhone || iPod || iPad { break }
            
            if value.stringValue.contains("iPhone") { iPhone = true }
            if value.stringValue.contains("iPad") { iPad = true }
            if value.stringValue.contains("iPod") { iPod = true }
        }
        
        var enableDevice: [String] = [iPhoneName, iPadName, iPodName]
        
        var deviceDesc: String = ""
        if enableDevice.count == 1 {
            deviceDesc = enableDevice.first ?? ""
        } else {
            
            for index in 0...enableDevice.count-1 {
                if deviceDesc.isEmpty {
                    deviceDesc = enableDevice[index]
                } else {
                    deviceDesc += ", \(enableDevice[index])"
                }
            }
            
            deviceDesc += " 및 \(enableDevice.last ?? "")와(과) 호환."
        }
        
        
        return "iOS \(self.json["minimumOsVersion"].floatValue) 버전 이상이 필요. " + deviceDesc
    }
    
    /// 언어
    var languageCodesISO2A: [JSON] {
        return self.json["languageCodesISO2A"].arrayValue
    }
    
    /// 언어 string
    var languageCodesISO2AValue: String {
        
        var result = ""
        for value in self.json["languageCodesISO2A"].arrayValue {
            if result.isEmpty {
                result = value.stringValue
            } else {
                result += ", \(value.stringValue)"
            }
        }
        return result
    }
    
    /// 연령
    var trackContentRating: String {
        return self.json["trackContentRating"].stringValue
    }
    
    /// 콘텐츠 등급
    var contentAdvisoryRating: String {
        return self.json["contentAdvisoryRating"].stringValue
    }
    
    /// 개발자 웹사이트
    var sellerUrl: String {
        return self.json["sellerUrl"].stringValue
    }
    
    /// 게임센터 연동가능여부
    var isGameCenterEnabled: Bool {
        return self.json["isGameCenterEnabled"].boolValue
    }
    
    /// 공유 메세지
    var shareMessage: String {
        return "\(self.json["artistName"].stringValue)의 \(self.json["trackName"].stringValue)\n\(self.json["trackViewUrl"].stringValue)"
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    
    
    /// 최초등록일?
    var releaseDate: String {
        return self.json["releaseDate"].stringValue
    }
    
    /// 검색 종류
    var kind: String {
        return self.json["kind"].stringValue
    }
    
    /// 화폐
    var currency: String {
        return self.json["currency"].stringValue
    }
    
    /// ?
    var userRatingCountForCurrentVersion: String {
        return self.json["userRatingCountForCurrentVersion"].stringValue
    }
    
    /// ?
    var trackCensoredName: String {
        return self.json["trackCensoredName"].stringValue
    }
    
    /// artistId
    var artistId: Int {
        return self.json["artistId"].int ?? 0
    }
    
    /// artistName
    var artistName: String {
        return self.json["artistName"].stringValue
    }
    
    /// id
    var primaryGenreId: Int {
        return self.json["primaryGenreId"].int ?? 0
    }
    
    /// ids
    var genreIds: [JSON] {
        return self.json["genreIds"].arrayValue
    }
    
    /// 스토어 URL
    var trackViewUrl: String {
        return self.json["trackViewUrl"].stringValue
    }
    
    /// bundleId
    var bundleId: String {
        return self.json["bundleId"].stringValue
    }
    
    /// trackId
    var trackId: Int {
        return self.json["trackId"].int ?? 0
    }
    
    /// minimumOsVersion
    var minimumOsVersion: Float {
        return self.json["minimumOsVersion"].floatValue
    }

    /// 앱아이콘_60
    var artworkUrl60: String {
        return self.json["artworkUrl60"].stringValue
    }
    
    /// 앱아이콘_100
    var artworkUrl100: String {
        return self.json["artworkUrl100"].stringValue
    }
    
    /// 앱아이콘_512
    var artworkUrl512: String {
        return self.json["artworkUrl512"].stringValue
    }
    
    func informationContent(type: AppDetailInformationContent) -> String {
        
        switch type {
        case .sellerName: return self.sellerName
        case .fileSize: return self.fileSizeMegaBytes
        case .category: return self.genresValue
        case .supportedDevices: return self.compatibility
        case .languageCodesISO2A: return self.languageCodesISO2AValue
        case .contentAdvisoryRating: return self.contentAdvisoryRating
        case .copyRight: return "Copyright " + self.sellerName
        case .developerWebsite: return  ""
        case .privacyPolicy: return  ""
        }
    }
}
