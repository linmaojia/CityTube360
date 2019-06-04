//
//  GlobalManager.swift
//  XLCustomer
//
//  Created by longma on 2019/1/3.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJUserManager: NSObject {
    
    @objc var userModel:UserModel?
    @objc var tokenModel:TokenModel?

    //MARK: ************** 初始化
    @objc static let shared : MJUserManager = {
        
        let manager = MJUserManager()
        return manager
    }()
    
    /// 添加 UserDefault 持久化字段
    class func setUserDefault(value: Any?, key: String) {
        let defaultStand = UserDefaults.standard
        defaultStand.set(value, forKey: key)
        defaultStand.synchronize()
    }
    
    /// 获取 UserDefault 持久化
    class func getUserDefault(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    /// 是否登录
    var isLogin: Bool{
        
        return userModel != nil
    }
    func saveToken(token:TokenModel?){
        
        NSKeyedArchiver.archiveRootObject(token as Any, toFile: kTokenDir)
    }
    func token() -> TokenModel?{
        
        if let tokenModel = NSKeyedUnarchiver.unarchiveObject(withFile: kTokenDir) as? TokenModel{
            
            return tokenModel
        }else{
            return nil
        }
    }
    /// 保存用户信息
    ///
    /// - Parameter user: 用户模型
    func saveUser(user:UserModel?){
        
        userModel = user

        NSKeyedArchiver.archiveRootObject(user as Any, toFile: kUserDir)
    }
    func user() -> UserModel?{
        
        if let userModel = NSKeyedUnarchiver.unarchiveObject(withFile: kUserDir) as? UserModel{
            
            return userModel
        }else{
            return nil
        }
    }
    
    /// 恢复用户基本信息
    func restoreUserInfo(){
        userModel = self.user()
        tokenModel = self.token()
    }
}
