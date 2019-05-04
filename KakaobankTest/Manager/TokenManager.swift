//
//  TokenManager.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation
import KeychainSwift

class TokenManager {
    
    static let shared = TokenManager()
    
    private let realmKey = "kakaobank_190504_tempkey"
    
    private var keychain: KeychainSwift {
        let keychain = KeychainSwift()
        return keychain
    }
    
    var realmKeyData: Data {
        guard let key = keychain.getData(realmKey) else {
            var key = Data(count: 64)
            _ = key.withUnsafeMutableBytes { bytes in
                SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
            }
            keychain.set(key, forKey: realmKey)
            
            return key
        }
        return key
    }
}
