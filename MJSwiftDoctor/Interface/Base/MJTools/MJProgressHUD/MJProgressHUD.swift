//
//  MJProgressHUD.swift
//  XLCustomer
//
//  Created by longma on 2019/1/8.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast
class MJProgressHUD: NSObject {
    class func show() {
        SVProgressHUD.show()
    }
    
    class func show(withStatus status: String?) {
        SVProgressHUD.show(withStatus: status)
    }
    
    class func showSuccess(withStatus status: String?) {
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    class func showError() {
        SVProgressHUD.showError(withStatus: "操作失败")
    }
    
    class func showError(withStatus status: String?) {
        SVProgressHUD.showError(withStatus: status)
    }
    
    class func showInfo(withStatus status: String?) {
        SVProgressHUD.showInfo(withStatus: status)
    }
    class func showToat(withStatus status: String?) {
        // create a new style
        let style = CSToastStyle.init(defaultStyle: ())
        // this is just one of many style options
        style?.messageColor = UIColor.white
        style?.messageFont = UIFont.systemFont(ofSize: 15)
        style?.messageAlignment = .center
        style?.cornerRadius = 3
        style?.verticalPadding = 10
        
        // present the toast with the new style
        let topVC: UIViewController? = MJManager.getTopVC()
        topVC?.view.makeToast(status, duration: 2.0, position: NSValue(cgPoint: CGPoint(x: kSCREEN_WIDTH / 2, y: kSCREEN_HEIGHT / 2 - 20)), style: style)
    }
    class func showToatBottom(withStatus status: String?) {
        // create a new style
        let style = CSToastStyle.init(defaultStyle: ())
        // this is just one of many style options
        style?.messageColor = UIColor.white
        style?.messageFont = UIFont.systemFont(ofSize: 15)
        style?.messageAlignment = .center
        style?.cornerRadius = 3
        style?.verticalPadding = 10
        
        // present the toast with the new style
        let topVC: UIViewController? = MJManager.getTopVC()
        topVC?.view.makeToast(status, duration: 2.0, position: NSValue(cgPoint: CGPoint(x: kSCREEN_WIDTH / 2, y: kSCREEN_HEIGHT - 60)), style: style)

    }
   
}
