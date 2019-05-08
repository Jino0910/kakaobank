//
//  NSDate+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

extension Date {
    
    func years(from date: Date) -> Int{

        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    func months(from date: Date) -> Int{
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    func weeks(from date: Date) -> Int{
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    
    func days(from date: Date) -> Int{
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func hours(from date: Date) -> Int{
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func minutes(from date: Date) -> Int{
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func seconds(from date: Date) -> Int{
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))년 전" }
        if months(from: date)  > 0 { return "\(months(from: date))개월 전" }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))주 전" }
        if days(from: date)    > 0 { return "\(days(from: date))일 전" }
        if hours(from: date)   > 0 { return "\(hours(from: date))시간 전" }
        if minutes(from: date) > 0 { return "\(minutes(from: date))분 전" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))초 전" }
        return ""
    }
}
