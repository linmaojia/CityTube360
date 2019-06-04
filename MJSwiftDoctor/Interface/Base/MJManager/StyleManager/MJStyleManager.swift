//
//  GlobalManager.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJStyleManager: NSObject {
    
    /** 配置全局样色 */
    class func customDefaultStyle(){
        //配置IQKeyboardManager
        let manager = IQKeyboardManager.shared()
        //manager.shouldResignOnTouchOutside = YES; //设置点击View其它位置收回键盘
        manager.toolbarDoneBarButtonItemText = "完成"
        
        //配置SVProgressHUD
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 16))
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        
        //配置UITableView
        if #available(iOS 11.0, *) {
            UITableView.appearance().estimatedRowHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
            UITableView.appearance().estimatedSectionHeaderHeight = 0
        }
    }
    
    /// 配置分页控制
    ///
    /// - Returns: 样色
    class func configPageView(titleSelectedColor:UIColor = UIColor.MJTheme.black) -> SGPageTitleViewConfigure{
        let configure = SGPageTitleViewConfigure.init()
        configure.needBounces = false
        configure.titleFont = UIFont.mjFont(15)
        configure.titleColor = UIColor.MJTheme.gray
        configure.titleSelectedColor = titleSelectedColor
        configure.indicatorStyle = SGIndicatorStyleFixed
        configure.bottomSeparatorColor = UIColor.clear
        configure.indicatorColor = UIColor.MJTheme.main
        configure.indicatorAnimationTime = 0.2
        configure.indicatorFixedWidth = 20
        configure.indicatorHeight = 3
        configure.indicatorCornerRadius = 2
        
        return configure
    }
    
}
