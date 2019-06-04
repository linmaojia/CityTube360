//
//  Macro.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import Foundation
import UIKit


/*=================================全局变量===============================================*/
let kViewSale16:CGFloat = (9/16)
let kViewSpace:CGFloat = 15//tableView 边距
let kViewSubSpace:CGFloat = 10//普通 边距
let kViewRadius:CGFloat = 5//view 圆角
let kViewSRadius:CGFloat = 3//view 阴影圆角
let kBgViewSRadius:CGFloat = 8//view 阴影圆角
let kViewSOffset:CGSize = CGSize(width: 1, height: 1) //view 阴影偏移
let kBgViewSOffset:CGSize = CGSize(width: 0, height: 1) //view 阴影偏移

let kNavBtnWidth:CGFloat = 35 //导航栏item按钮宽度
let kNavBtnSpace:CGFloat = 5//导航栏item按钮边距距离
let kNavBtnTitleWidth:CGFloat = 85//导航栏按钮标题宽度

let kViewAwaitTime:Double = 1.2//等待时间


/*=================================路径===============================================*/
/// 用户资料途径
let kUserDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory,
                                                    .userDomainMask, true)[0] + "/kUserDir.data"
/// token途径
let kTokenDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory,
                                                   .userDomainMask, true)[0] + "/kTokenDir.data"
