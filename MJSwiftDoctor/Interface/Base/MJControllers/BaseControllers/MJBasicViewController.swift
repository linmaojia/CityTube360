//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit

 class MJBasicViewController: UIViewController {
    var btnBack:UIButton!
    var isMainNavBarStyle:Bool = false
    var navRightItem:UIBarButtonItem!
    
    override func viewDidLoad() {
  
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.MJTheme.bg
        self.setBackItemAppearance()
        
        if isMainNavBarStyle {
            let mainImage = UIImage.mj_image(with: UIColor.rgb(8,190,235))
            navigationController?.navigationBar.setBackgroundImage(mainImage, for: .default)
            //更换返回按钮
            let leftImage = UIImage.init(named: "backWhite")
            let newImage = leftImage?.mj_imageChange(with: UIColor.white)
            btnBack.setImage(newImage, for: .normal)
            //中间标题
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.mjFont(17, isBold: true)]
            //隐藏导航栏底部的线条
            navigationController?.navigationBar.shadowImage = UIImage.init()
        }
    }
    @objc func actionBackClick(){
        navigationController?.popViewController(animated: true)
    }
    
  
    /// 延迟返回
    ///
    /// - Parameters:
    ///   - isWait: 是否等待
    ///   - time: 时间
    func popViewController(isWait:Bool = true,time:Double = kViewAwaitTime) {
        if isWait {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self.navigationController?.popViewController(animated: true)
            })
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }

    ///  设置导航栏右边图片按钮
    ///
    /// - Parameter name: 图片名称
    @objc func setNavRightItemImage(name: String?) {
        let rightImage = UIImage(named: name ?? "")
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: kSCREEN_WIDTH - kNavBtnWidth - kNavBtnSpace, y: 0.0, width: kNavBtnWidth, height: kNAVBAR_HEIGHT)
        rightButton.addTarget(self, action: #selector(self.actionRightItemClick), for: .touchUpInside)
        rightButton.setImage(rightImage, for: .normal)
        navigationController?.navigationBar.addSubview(rightButton)
    }
    
    /// 设置导航栏右边文字按钮
    ///
    /// - Parameter title: 标题
    func setNavRightItem(title: String,titleColor:UIColor = UIColor.MJTheme.black) {
        navRightItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.actionRightItemClick))
        navRightItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.mjFont(15),NSAttributedString.Key.foregroundColor: titleColor], for: .normal)
        navRightItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.mjFont(15),NSAttributedString.Key.foregroundColor: titleColor], for: .highlighted)

        navigationItem.rightBarButtonItem = navRightItem

    }
    
    /// 右侧导航栏标题按钮点击
    @objc func actionRightItemClick(){
        
    }
    /// 设置返回按钮
    func setBackItemAppearance() {
        let arrViewControllers = navigationController?.viewControllers
        
        if ((arrViewControllers as NSArray?)?.index(of: self) ?? 0) > 0 {
            let leftImage = UIImage(named: "backblack")
            btnBack = UIButton(type: .custom)
            btnBack.frame = CGRect(x: kNavBtnSpace, y: 0.0, width: kNavBtnWidth, height: kNAVBAR_HEIGHT)
            btnBack.addTarget(self, action: #selector(self.actionBackClick), for: .touchUpInside)
            btnBack.setImage(leftImage, for: .normal)
            navigationController?.navigationBar.addSubview(btnBack)
        }
        //隐藏返回按钮
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }

    /// 设置全屏
    ///
    /// - Parameter tbvData: UITableView
    func setAdjustmentBehavior(srvData:UIScrollView){
        if #available(iOS 11.0, *) {
            srvData.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    /// 根据target 字符串跳转控制器
    ///
    /// - Parameter targetStr: 控制器字符串
    func pushViewController(targetStr:String){
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
        let className=clsName! + "." + targetStr
        let viewC = NSClassFromString(className)!as! UIViewController.Type //这里需要指定类的类型XX.Type
        let vc =  viewC.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /// 状态栏设置
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if isMainNavBarStyle {
            return .lightContent
        }else{
            return .default
        }
    }
    
    deinit {
        print("[\(NSStringFromClass(type(of: self).self))]===已被释放")
    }
}

