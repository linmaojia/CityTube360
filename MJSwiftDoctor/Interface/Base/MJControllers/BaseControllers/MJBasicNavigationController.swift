//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit
import RTRootNavigationController
class MJBasicNavigationController: RTRootNavigationController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.setupNavigationBarTheme()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    //MARK: ******************* 添加控制器 *******************
    //MARK: 设置UINavigationBar的主题
    func setupNavigationBarTheme(){
        //第三方 //若要修改导航栏相关属性须加这句代码
        self.useSystemBackBarButtonItem = true;
        
        let appearance = UINavigationBar.appearance()
        
        // 设置导航栏背景图片,用图片背景
        appearance.setBackgroundImage(UIImage.mj_image(with: UIColor.MJTheme.navBg), for: .default)
        //appearance.shadowImage = UIImage.init(named: "navLine") //浅色
        appearance.shadowImage = UIImage.init()
        
        //设置导航栏背景 颜色
        appearance.isTranslucent = false //设置为没有毛玻璃效果
        appearance.barTintColor = UIColor.MJTheme.navBg //修改NavigationBar背景颜色
    
        // 设置中部文字属性
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.MJTheme.black, NSAttributedString.Key.font: UIFont.mjFont(17, isBold: true)]
        
        //设置返回文字颜色,默认返回按钮颜色
        appearance.tintColor = UIColor.MJTheme.black
        
    }

}

