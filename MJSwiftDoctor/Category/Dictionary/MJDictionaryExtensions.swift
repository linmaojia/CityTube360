//
//  ColorTheme.swift
//  CommonLib
//
//  Created by JYCJ on 2018/1/18.
//

import UIKit

extension Dictionary {
    
    
    /// 字典转字符串
    ///
    /// - Returns: 字符串
    func mj_dictionaryConvertToString() -> String {
        
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        if let json = jsonData {
            return String(data: json, encoding: .utf8)!
        }
        return ""
    }
}
