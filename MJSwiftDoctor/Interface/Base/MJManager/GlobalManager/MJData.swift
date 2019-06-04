//
//  GlobalManager.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJData: NSObject {
    var qCloudPath:String = ""
    /// 记录数据请求时的时间
    var currentDate:Date?
    
    //MARK: ************** 初始化
    static let shared : MJData = {
        
        let manager = MJData()
        return manager
    }()
    
    
}
