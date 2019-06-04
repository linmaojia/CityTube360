//
//  GlobalManager.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJManager: NSObject {
    //MARK: ********************************************************  其他
    

    
    /**
     生成随机字符串,
     
     - parameter length: 生成的字符串的长度
     
     - returns: 随机生成的字符串
     */
    class func getRandomString(withlength length: Int) -> String {
        let characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.count)))
            ranStr.append(characters[characters.index(characters.startIndex, offsetBy: index)])
        }
       
        return ranStr
        
    }
    
    
    /// 聊天会话列表 头像缩略图
    class func urlThumbnail(imageUrl: String) -> URL{
        let newUrl = "\(imageUrl)?imageView2/1/w/200/h/200/q/85"
        return newUrl.mj_url
    }
    /// 判断字符串是否为空
    class func isNullString(string: String?) -> Bool{
        
        if let text = string, text.count > 0 {
            return false
        }
        else{
            return true
        }
    }
   
    
   
   /// 判断是否登录
   class func isLogin() -> Bool{

        if MJUserManager.shared.isLogin{
            return true
        }else{
            self.presentLoginVC()
             return false
        }
    }

    
    /// 跳转到登录界面
    class func presentLoginVC() {
        let topVC = self.getTopVC()
        let nav = MJBasicNavigationController.init(rootViewController: MineLoginVC())
        topVC!.present(nav, animated: true, completion: nil)
    }
    
    /// 获取IM性别字符串
    class func getIMGenderHeadImv(_ genderInt:Int , smallImv:Bool = false) -> UIImage {
        if smallImv {
            
            if (genderInt == 1) {
                return UIImage(named: "男性")!
            } else if (genderInt == 2) {
                return UIImage(named: "女性")!
            } else {
                return UIImage(named: "未知性别")!
            }
        }else{
            if (genderInt == 1) {
                return UIImage(named: "默认头像男")!
            } else if (genderInt == 2) {
                return UIImage(named: "默认头像女")!
            } else {
                return UIImage(named: "默认头像")!
            }
        }
        
        
    }
    
    /// 获取结婚字符串
    class func getMarriedStr(_ isMarry:Bool) -> String {
        
        if isMarry {
            return "已婚"
        }else {
            return "未婚"
        }
    }
    /// 获取性别字符串
    class func getGenderStr(_ genderStr:String) -> String {
        
        if (genderStr == "0") {
            return "男"
        } else if (genderStr == "1") {
            return "女"
        } else {
            return "未知"
        }
    }
    /// 获取性别图片
    class func getGenderHeadImv(_ genderStr:String) -> UIImage {
        
        if (genderStr == "0") {
            return UIImage(named: "默认头像男")!
        } else if (genderStr == "1") {
            return UIImage(named: "默认头像女")!
        } else {
            return UIImage(named: "默认头像")!
        }
    }
    
   /// 普通的获取UUID的方法
    class func getUUID() -> String {
        let uuid = NSUUID().uuidString
        let strUrl = uuid.replacingOccurrences(of: "-", with: "")
        return strUrl
    }
    
  
    
    class func getGMTFormatter(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss 'GMT'"
       let locale = Locale.init(identifier: "en_US")
        dateFormatter.locale = locale
        let fixString = dateFormatter.string(from: date)
       
        return fixString
    }

    
    //MARK: ********************************************************  UI
    
    
    
    
    //MARK: ********************************************************  控制器
    // MARK: - 查找顶层控制器、
    // 获取顶层控制器 根据window
    @objc class func getTopVC() -> (UIViewController?) {
        var window = UIApplication.shared.keyWindow
        //是否为当前显示的window
        if window?.windowLevel != UIWindowLevelNormal{
            let windows = UIApplication.shared.windows
            for  windowTemp in windows{
                if windowTemp.windowLevel == UIWindowLevelNormal{
                    window = windowTemp
                    break
                }
            }
        }
        let vc = window?.rootViewController
        return getTopVC(withCurrentVC: vc)
    }
    ///根据控制器获取 顶层控制器
   class func getTopVC(withCurrentVC VC :UIViewController?) -> UIViewController? {
        if VC == nil {
            print("🌶： 找不到顶层控制器")
            return nil
        }
        if let presentVC = VC?.presentedViewController {
            //modal出来的 控制器
            return getTopVC(withCurrentVC: presentVC)
        }else if let tabVC = VC as? UITabBarController {
            // tabBar 的跟控制器
            if let selectVC = tabVC.selectedViewController {
                return getTopVC(withCurrentVC: selectVC)
            }
            return nil
        } else if let naiVC = VC as? UINavigationController {
            // 控制器是 nav
            return getTopVC(withCurrentVC:naiVC.visibleViewController)
        } else {
            // 返回顶控制器
            return VC
        }
    }
    
    
    
}
