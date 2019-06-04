//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit

 extension Date {
    
    /// 时间戳字符串
    var mj_timestampStr: String{
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeString = String(format: "%.0f", timeInterval)
        return timeString
    }
    
    /// 时间戳装换为指定格式
    ///
    /// - Parameter format: 转换格式 @"yyyy-MM-dd HH:mm:ss zzz"]; aaa 上午/下午
    /// - Returns: 字符串
    func mj_string(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.amSymbol = "上午"
        dateFormatter.pmSymbol = "下午"
        return dateFormatter.string(from: self)
    }
    
    /// 计算年龄
    var mj_age: Int {
        // 出生日期转换 年月日
        let components1 = Calendar.current.dateComponents([.day, .month, .year], from: self)
        let brithDateYear = components1.year ?? 1
        let brithDateDay = components1.day ?? 1
        let brithDateMonth = components1.month ?? 1
        
        // 获取系统当前 年月日
        let components2: DateComponents = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let currentDateYear: Int = components2.year ?? 1
        let currentDateDay: Int = components2.day ?? 1
        let currentDateMonth: Int = components2.month ?? 1
    
        // 计算年龄
        var iAge: Int = currentDateYear - brithDateYear - 1
        if (currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay) {
            iAge += 1
        }
        
        return iAge
    }
    
}




