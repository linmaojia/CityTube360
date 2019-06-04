import UIKit



class XLTabBarController: UITabBarController , UITabBarControllerDelegate {
    
    deinit {
        print("MainTabBarController销毁")
    }
    //MARK: --life cyle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(showNewBadgeNumber(_:)), name: NSNotification.Name(rawValue:MJNewChatBadgeNotification), object: nil)
        
        self.tabBarController?.hidesBottomBarWhenPushed = true
        initBaseLayout()
        setTabBarAppearance()
        self.delegate = self
        
    }
    
    @objc func showNewBadgeNumber(_ sender: Notification?) {
        
        if let count = sender?.userInfo?["count"] as? Int{
            
            var countStr: String? = nil
            
            countStr = "\(count)"
            
            if count > 99 {
                countStr = "99+"
            }
            if count == 0 {
                countStr = nil
            }
            tabBar.items?[1].badgeValue = countStr
        }
        
        
    }

    
    /**
     *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
     */
    func setTabBarAppearance(){
        
        //barItem
        let barItem = UITabBarItem.appearance()
        
        // 设置字体颜色
        barItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.MJTheme.gray], for: .normal)//未选中
        
        barItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.MJTheme.main], for: .selected)//选中
     
        //UITabBar
        //设置背景图片
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isTranslucent = false
        //去除 TabBar 自带的顶部阴影
        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.backgroundImage = UIImage.init()
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        self.tabBar.layer.shadowOpacity = 0.3
    }
    
    //MARK: - prinvate methods
    //添加视图
    func initBaseLayout(){
        //主页
        let homeVC = WorkHomeVC()
        
        let homeNav = MJBasicNavigationController(rootViewController: homeVC)
        let image1 = UIImage.init(named: "xian-shouye")?.withRenderingMode(.alwaysOriginal)
        let image1_s = UIImage(named: "mian-shouye")?.withRenderingMode(.alwaysOriginal)
        let item1:UITabBarItem = UITabBarItem(title: "首页", image: image1, selectedImage: image1_s)
        item1.tag = 0
        homeNav.tabBarItem = item1
        homeVC.title = "裕永医生"
        
        //沟通
        let consultVC = ConsultHomeVC()
        let consultNav = MJBasicNavigationController(rootViewController: consultVC)
        let image2 = UIImage(named: "xian-huihua")?.withRenderingMode(.alwaysOriginal)
        let image2_s = UIImage(named: "mian-huihua")?.withRenderingMode(.alwaysOriginal)
        let item2:UITabBarItem = UITabBarItem(title: "咨询", image: image2, selectedImage: image2_s)
        item2.tag = 1
        consultNav.tabBarItem = item2
        consultVC.title = "会话列表"
        
        //商城
        let storeVC = StoreHomeVC()
        let storeNav = MJBasicNavigationController(rootViewController: storeVC)
        let image3 = UIImage(named: "xian-shangcheng")?.withRenderingMode(.alwaysOriginal)
        let image3_s = UIImage(named: "mian-shangcheng")?.withRenderingMode(.alwaysOriginal)
        let item3:UITabBarItem = UITabBarItem(title: "商城", image: image3, selectedImage: image3_s)
        item3.tag = 2
        storeNav.tabBarItem = item3
        storeVC.title = "商城"
        
        //消息
        let newVC = NewHomeVC()
        let newnNav = MJBasicNavigationController(rootViewController: newVC)
        let image4 = UIImage(named: "xian-xiaoxi")?.withRenderingMode(.alwaysOriginal)
        let image4_s = UIImage(named: "mian-xiaoxi")?.withRenderingMode(.alwaysOriginal)
        let item4:UITabBarItem = UITabBarItem(title: "消息", image: image4, selectedImage: image4_s)
        item4.tag = 3
        newnNav.tabBarItem = item4
        newVC.title = "消息"
        
        
        //我的
        let mineVC = MineHomeVC()
        let mineNav = MJBasicNavigationController(rootViewController: mineVC)
        let image5 = UIImage(named: "xian-wode")?.withRenderingMode(.alwaysOriginal)
        let image5_s = UIImage(named: "mian-wode")?.withRenderingMode(.alwaysOriginal)
        let item5:UITabBarItem = UITabBarItem(title: "我的", image: image5, selectedImage: image5_s)
        item5.tag = 4
        mineNav.tabBarItem = item5
        mineVC.title = "我"
        
        let tabArray = [homeNav,consultNav,storeNav,newnNav,mineNav]
        self.viewControllers = tabArray
        
        self.selectedIndex = 1

        
    }
    //跳转到首页
    @objc func pushHome(){
        self.selectedIndex = 0
    }
    //跳转到收藏
    @objc func pushCollection() {
        self.selectedIndex = 2
    }
    
    //MARK: --setter getter
    var _lastSelectedIndex: NSInteger!
    var lastSelectedIndex: NSInteger {
        if _lastSelectedIndex == nil {
            _lastSelectedIndex = NSInteger()
            //判断是否相等,不同才设置
            if (self.selectedIndex != selectedIndex) {
                //设置最近一次
                _lastSelectedIndex = self.selectedIndex;
            }
            //调用父类的setSelectedIndex
            super.selectedIndex = selectedIndex
        }
        return _lastSelectedIndex
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //获取选中的item
        let tabIndex = tabBar.items?.index(of: item)
        if tabIndex != self.selectedIndex {
            //设置最近一次变更
            _lastSelectedIndex = self.selectedIndex
        }
    }
    
    //MARK: -- UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController == self.viewControllers![2]  {
//            if change {
//                
//                self.selectedIndex = _lastSelectedIndex
//                let login = LoginViewController()
//                //login.tag = 2
//                let nav = UINavigationController(rootViewController: login)
//                self.viewControllers![selectedIndex].present(nav, animated: true, completion: nil)
//                return false
//            } else {
//                return true
//            }
//        }
        return true
    }
}

