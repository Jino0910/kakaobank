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
    
    /// 최신업데이트 날짜
    var currentVersionReleaseDate: String {
        return self.json["currentVersionReleaseDate"].stringValue
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
    
    /// 카테고리 영어
    var primaryGenreName: String {
        return self.json["primaryGenreName"].stringValue
    }
    
    /// 카테고리 한글
    var genres: [JSON] {
        return self.json["primaryGenreName"].arrayValue
    }
    
    /// 지원가능 디바이스
    var supportedDevices: [JSON] {
        return self.json["supportedDevices"].arrayValue
    }
    
    /// 언어
    var languageCodesISO2A: String {
        return self.json["languageCodesISO2A"].stringValue
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
}
