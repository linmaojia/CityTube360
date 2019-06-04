//
//  ColorTheme.swift
//  CommonLib
//
//  Created by JYCJ on 2018/1/18.
//

import UIKit

extension UIFont {
    
    class func mjFont(_ ofSize: CGFloat, isBold: Bool = false) -> UIFont{
        
        if isBold {
            guard let font = UIFont(name: "PingFangSC-Medium", size: ofSize) else {
                return UIFont.boldSystemFont(ofSize: ofSize)
            }
            return font

        }else{
            guard let font = UIFont(name: "PingFangSC-Regular", size: ofSize) else {
                return UIFont.systemFont(ofSize: ofSize)
            }
            return font
        }
        
      
    }
}
