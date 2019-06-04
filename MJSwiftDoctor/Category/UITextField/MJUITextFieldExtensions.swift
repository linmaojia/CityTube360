//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit



extension UITextField {
    
    /// 设置空隙
    ///
    /// - Parameters:
    ///   - leftSpace: 左边空隙
    ///   - rightSpace: 右边空隙
    func setSpace(leftSpace:CGFloat = 5,rightSpace:CGFloat = 0){
        //设置左边视图的宽度
        self.leftView = UIView.init(frame: .init(x: 0, y: 0, width: leftSpace, height: 0))
        self.leftViewMode = .always
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)

        if rightSpace > 0{
            self.rightView = UIView.init(frame: .init(x: 0, y: 0, width: rightSpace, height: 0))
        }
    }
    
    
}

//MARK: ********************************************************  转换
extension UITextField {
    
     /// 延迟打开键盘
     func mj_becomeFirstResponder(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            self.becomeFirstResponder()
        })
     }
}






