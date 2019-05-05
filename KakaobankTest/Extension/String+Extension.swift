//
//  String+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

extension String {
    
    func URLEncode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    /// 한글 검증
    var checkKorean: Bool {
        let regEx = "^[가-힣ㄱ-ㅎㅏ-ㅣ\\s]$"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return emailTest.evaluate(with: self)
    }
}
