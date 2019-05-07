//
//  NSDate+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation

extension NSDate {
    
    func yearsFrom(_ date: Date) -> Int{

        return Calendar.current.component(.year, from: date)
    }
    
    func monthsFrom(_ date: Date) -> Int{
        return Calendar.current.component(.month, from: date)
    }
    
    func weeksFrom(_ date: Date) -> Int{
        return Calendar.current.component(.weekOfYear, from: date)
    }
    
    func daysFrom(_ date: Date) -> Int{
        return Calendar.current.component(.day, from: date)
    }
    
    func hoursFrom(_ date: Date) -> Int{
        return Calendar.current.component(.hour, from: date)
    }
    
    func minutesFrom(_ date: Date) -> Int{
        return Calendar.current.component(.minute, from: date)
    }
    
    func secondsFrom(_ date: Date) -> Int{
        return Calendar.current.component(.second, from: date)
    }
    
    func offsetFrom(date: Date) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))년 전" }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))개월 전" }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))주 전" }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))일 전" }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))시간 전" }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))분 전" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))초 전" }
        return ""
    }
}
