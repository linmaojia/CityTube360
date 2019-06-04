//
//  AppDelegate.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        self.setThirdPartyService(launchOptions)

        self.window?.rootViewController = XLTabBarController()
        
        MJUserManager.shared.restoreUserInfo()
        
        
        return true
    }
    /*=================================注册第三方服务====================================*/
    func setThirdPartyService(_ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        MJStyleManager.customDefaultStyle()
        
        self.setJMessageService(launchOptions)

    }
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //注册极光token
        JMessage.registerDeviceToken(deviceToken)
    }
    
    //MARK: ********************************************************  初始化极光 IM SDK
    func setJMessageService(_ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        //配置极光参数
        JMessage.setupJMessage(launchOptions, appKey: kJMessageAppKey, channel: nil, apsForProduction: true, category: nil, messageRoaming: true)
        
        JMessage.add(self, with: nil)
        JMessage.setLogOFF() //关闭日志
        //        JMessage.setDebugMode()
        if #available(iOS 8, *) {
            JMessage.register(
                forRemoteNotificationTypes: UIUserNotificationType.badge.rawValue |
                    UIUserNotificationType.sound.rawValue |
                    UIUserNotificationType.alert.rawValue,
                categories: nil)
        } else {
            // iOS 8 以前 categories 必须为nil
            JMessage.register(
                forRemoteNotificationTypes: UIRemoteNotificationType.badge.rawValue |
                    UIRemoteNotificationType.sound.rawValue |
                    UIRemoteNotificationType.alert.rawValue,
                categories: nil)
        }
        
    }
    
}



//MARK: ****************************  极光IM Delegate
extension AppDelegate: JMessageDelegate {
    
    //监听数据库升级
    func onDBMigrateStart() {
        MJProgressHUD.showToat(withStatus: "数据库升级中")
    }
    //当前用户登录状态改变事件
    func onReceive(_ event: JMSGUserLoginStatusChangeEvent!) {
        switch event.eventType.rawValue {
        case JMSGLoginStatusChangeEventType.eventNotificationLoginKicked.rawValue,
             JMSGLoginStatusChangeEventType.eventNotificationServerAlterPassword.rawValue,
             JMSGLoginStatusChangeEventType.eventNotificationUserLoginStatusUnexpected.rawValue:
            _logout()
        default:
            break
        }
    }
    
    //弹出登录页面
    func _logout() {
       
        KAlertTitleView.showAlertTitleView(title: "您的账号在其它设备上登录，请重新登录") {
            
        }
    }
}


