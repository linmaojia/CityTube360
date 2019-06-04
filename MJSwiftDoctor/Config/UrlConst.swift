//
//  Macro.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import Foundation
import UIKit
/*=================================URL===============================================*/

func APIURL(_ aip:String) -> String{
    
    let currentDate = Date()
    MJData.shared.currentDate = currentDate
    #if DEBUG
    return "https://api.xldoctor.cn/release/" + currentDate.mj_timestampStr + aip
    #else
    return "https://api.xldoctor.cn/release/" + currentDate.mj_timestampStr + aip
    #endif
}
/* *************************登录模块*************************/

/// 用户名密码登录
var APILogin:String = "/u/Login"

/// 首页
var APIHome:String =  "/u/Home"

/// 腾讯云 获取签名
var APIQCloudSign:String = "/tencent/cos/auth"

/// 分页取省
var APIGetProvince:String =  "/City/GetProvince"
/// 分页取市
var APIGetCity:String = "/City/GetCity"
/// 分页取区
var APIGetDistrict:String = "/City/GetDistrict"
