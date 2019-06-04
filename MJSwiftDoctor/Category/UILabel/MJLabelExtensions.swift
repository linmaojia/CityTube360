//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit

//MARK: ********************************************************  IB
extension UILabel {
    @IBInspectable public var titleColorName: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.textColor = UIColor.MJTheme.color(with: newValue)
            }
            
        }
    }
    //MARK: ******************************************************** label 操作
    
    /// 多行字符串,字符串后面显示不全会自动换行
    ///
    /// - Parameter lineSpacing: 行空隙
    func mj_paragraphStyleWithLine(lineSpacing:CGFloat,wordSpacing:CGFloat = 0){
        
        let attributedString = NSMutableAttributedString.init(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing //行间距
        attributedString.addAttributes([NSAttributedStringKey.paragraphStyle:paragraphStyle,NSAttributedStringKey.kern:wordSpacing], range: NSMakeRange(0, (self.text?.count)!))
        self.attributedText = attributedString
        self.lineBreakMode = .byCharWrapping
       
    }
    
    /// 指定的字符串修改字体大小，颜色
    ///
    /// - Parameters:
    ///   - arrString: 字符串数组
    ///   - font: 字体
    ///   - color: 修改的颜色
    ///   - lineSpacing: 行间距
    func mj_paragraphStyleWithArrString(arrString:[String],font:UIFont?,color:UIColor?,lineSpacing:CGFloat = 4){
        
        let textAlignment = self.textAlignment
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSMutableAttributedString.init(string: self.text!, attributes: [NSAttributedStringKey.paragraphStyle:paragraphStyle])

        for string in arrString {
            if font != nil {
                let range = NSString.init(string: self.text!).range(of: string)
                attributedString .addAttribute(NSAttributedStringKey.font, value: font!, range: range)
            }
            
            if color != nil {
                let range = NSString.init(string: self.text!).range(of: string)
                attributedString .addAttribute(NSAttributedStringKey.foregroundColor, value: color!, range: range)
            }
        }
        
        self.attributedText = attributedString
        self.textAlignment = textAlignment

    }
}






