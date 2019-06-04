//
//  ColorTheme.swift
//  CommonLib
//
//  Created by JYCJ on 2018/1/18.
//

import UIKit


//MARK: ********************************************************  拓展

// MARK: - 设置 UIColor的Alpha
extension UIColor {
     func mj_colorWithAlpha(customAlpha:CGFloat) -> UIColor{
        
        let newColor = UIColor.rgb(self.rgbComponents.red, self.rgbComponents.green, self.rgbComponents.blue,transparency: customAlpha)
        return newColor
    }
}

extension UIColor {
    

    @objc class func rgb(_ red: Int,_ green: Int,_ blue: Int, transparency: CGFloat = 1) -> UIColor{
        
        return UIColor.init(red: red, green: green, blue: blue, transparency: transparency)!
    }
    
    struct MJTheme {
        /// 主色调 浅蓝色 rgb(22,175,220)
        static let main = UIColor.init(red: 22, green: 175, blue: 220)!
        
        /// 正文颜色 黑色 rgb(34,34,34)
        static let dark = UIColor.init(red: 34, green: 34, blue: 34)!

        /// 正文颜色 黑色2 rgb(51,51,51)
        static let black = UIColor.init(red: 51, green: 51, blue: 51)!
        
        /// 附文颜色 灰色 rgb(134,134,134)
        static let gray = UIColor.init(red: 134, green: 134, blue: 134)!
        
        /// 提示颜色 浅灰色 rgb(153,153,153)
        static let lightGray = UIColor.init(red: 153, green: 153, blue: 153)!
        
        /// 背景色 浅白色
        static let bg = UIColor.init(red: 246, green: 246, blue: 246)!
        
        /// 红色 
        static let red = UIColor.init(red: 255, green: 85, blue: 85)!
        /// 搜索框背景
        static let searchBarBg = UIColor.init(red: 226, green: 226, blue: 226)!
        /// 边框
        static let border = UIColor.init(red: 223, green: 223, blue: 223)!
        
        /// 阴影
        static let shadow = UIColor.init(red: 204, green: 214, blue: 215, transparency: 0.5)!
        
        /// window 背景色
        static let window = UIColor.init(red: 0, green: 0, blue: 0, transparency: 0.5)!
        /// 导航栏背景
        static let navBg = UIColor.white
        /// 根据字符串获取颜色
        ///
        /// - Parameter name: 字符串
        /// - Returns: 颜色
        static func color(with name: String) -> UIColor {
            
            switch name {
            case "main":
                return main
            case "dark":
                return dark
            case "black":
                return black
            case "gray":
                return gray
            case "lightGray":
                return lightGray
            case "bg":
                return bg
            case "red":
                return red
            case "border":
                return border
            case "window":
                return window
            default:
                return UIColor.black
            }
        }
        

    }
}
