//
//  Const.swift
//  XLCustomer
//
//  Created by longma on 2019/1/2.
//  Copyright © 2019年 XLH. All rights reserved.
//

import Foundation
import UIKit
/*=================================尺寸(适配)===============================================*/
/* 屏幕宽度和高度*/
let kSCREEN_WIDTH = (UIScreen.main.bounds.size.width)
let kSCREEN_HEIGHT = (UIScreen.main.bounds.size.height)

//状态栏高度
let kSTATUS_BAR_HEIGHT =  (UIApplication.shared.statusBarFrame.size.height)
//导航栏高度
let kNAVBAR_HEIGHT =  (UINavigationController().navigationBar.frame.size.height)
// tabBar高度
let kTABBAR_HEIGHT:CGFloat =  49.0
// iPhone X底边距
let kBOTTOM_HEIGHT:CGFloat =  34.0
// 获取导航栏+状态栏的高度
let kSTATUS_NAV_HEIGHT =  (kSTATUS_BAR_HEIGHT + kNAVBAR_HEIGHT)



// 自动适配宽度,width为原始iPhone4/5的宽度
func AUTO_MATE_5_WIDTH(width:CGFloat) -> CGFloat{
    return width * kSCREEN_WIDTH/320
}
// 自动适配高度,width为原始iPhone4/5的高度
func AUTO_MATE_HEIGHT(height:CGFloat) -> CGFloat{
    return height * kSCREEN_HEIGHT/568
}
// 自动适配宽度,width为原始iPhone6/6s的宽度
func AUTO_MATE_WIDTH(width:CGFloat) -> CGFloat{
    return width * kSCREEN_WIDTH/375
}
// 自动适配宽度,width为原始比iPhone6/6s的宽度大的
func AUTO_MATE_GT_WIDTH(width:CGFloat) -> CGFloat{
    var screenW = kSCREEN_WIDTH
    if(IS_IPHONE4_5){
        screenW = 375
    }
    return width * screenW/375
}

// 判断是否iPhone4-5/iPhone6/plus
let IS_IPHONE4_5 = (kSCREEN_WIDTH == 320)
let IS_IPHONE6 = (kSCREEN_WIDTH == 375)
let IS_IPHONE6_PLUS = (kSCREEN_WIDTH == 414)
let IS_IPHONEX = (kSCREEN_WIDTH == 812)

func kDefaultImage() -> UIImage{
    return UIImage.init(named: "imvHead")!
}
