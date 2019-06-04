//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit


typealias completeBlock = () -> Void
extension UITextView {
    
    
}

//MARK: ********************************************************  转换
extension UITextView {
    //func mj_becomeFirstResponder(_ block: completeBlock?)
     /// 延迟打开键盘
     func mj_becomeFirstResponder(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            self.becomeFirstResponder()
        })
     }
}






