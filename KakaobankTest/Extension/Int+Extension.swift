//
//  Int+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

extension Int {
    
    func toHangulValue() -> String {

        switch self {
        case 0...999: return "\(self)"
        case 1000...9999: return "\(reviewCount(unit: 1000))천"
        case 10000...99999999: return "\(reviewCount(unit: 10000))만"
        default: return "0"
        }
        
    }
    
    func reviewCount(unit: Int) -> Double {
        
        let valueArray = "\(self)".compactMap{String($0)}

        // 반올림단위
        let roundValue = Int(pow(Double(10), CDouble(valueArray.count-3)))
        
        let value = CDouble((self+roundValue/2)/roundValue)
        
        return value/CDouble(unit/roundValue)
    }
}
