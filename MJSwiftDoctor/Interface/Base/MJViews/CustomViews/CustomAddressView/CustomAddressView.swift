//
//  MJLabelPadding.swift
//  XLCustomer
//
//  Created by longma on 2019/1/15.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class CustomAddressView: UIView {
    
    
    var index:Int = 0
    let titleFont:CGFloat = 15
    let scaleHeight:CGFloat = 0.6

    var provinceArray = [CityModel]()
    var cityArray = [CityModel]()
    var regionsArray = [CityModel]()
    var addressStr:String?

    var provinceModel:CityModel?
    var cityModel:CityModel?
    var districtModel:CityModel?

    var confirmBlock:((_ dateString:String) -> Void)?
    
    init(frame: CGRect , addressStr:String?) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        tap.delegate = self
        addGestureRecognizer(tap) //添加手势
        self.addressStr = addressStr
        self.addSubviewsForView()
        self.recovery()
    }
    func recovery(){
        if self.addressStr != nil {
            //回复数据
            self.getDataRecovery()
        }else{
            self.requestProvinceList()
            self.titles = ["请选择","",""]
            let subView = self.viewWithTag(100+self.index)
            self.titleBtnClick(sender: subView as! UIButton)
        }
    }
    
    func getDataRecovery(){
        if let arr = self.addressStr?.components(separatedBy: " ") {
            let a1 = arr[0]
            let a2 = arr[1]
            let a3 = arr[2]
            let parm = [
                "pageindex": 1,
                "paging": false
                ] as [String : Any]
           
            MJAFNetWorking.post(urlString: APIURL(APIGetProvince), parameters: parm, modelClass: CityModel.self ) { (response, error) in
                
                print("=================   \(response)")
                self.provinceArray += response as! [CityModel]
                for  model in self.provinceArray {
                    if model.name == a1 {
                        model.isSelect = true
                        self.provinceModel = model
                    }
                }
                let parm1 = [
                    "pageindex": 1,
                    "paging": false,
                    "model": ["provincename":a1]
                    ] as [String : Any]
                MJAFNetWorking.post(urlString: APIURL(APIGetCity), parameters: parm1, modelClass: CityModel.self  ) { (response, error) in
                    
                    self.cityArray.removeAll()
                    self.cityArray += response as! [CityModel]
                    for  model in self.cityArray {
                        if model.name == a2 {
                            model.isSelect = true
                            self.cityModel = model
                        }
                    }
                    
                    let parm2 = [
                        "pageindex": 1,
                        "paging": false,
                        "model": ["provincename":a1,"cityname":a2]
                        ] as [String : Any]
                    
                    MJAFNetWorking.post(urlString: APIURL(APIGetDistrict), parameters: parm2, modelClass: CityModel.self  ) { (response, error) in
                        
                        self.regionsArray.removeAll()
                        self.regionsArray += response as! [CityModel]
                        for  model in self.regionsArray {
                            if model.name == a2 {
                                model.isSelect = true
                                self.districtModel = model
                            }
                        }
                        
                        let tbvData = self.viewWithTag(300 + 0) as! UITableView
                        tbvData.reloadData()
                        let tbvData1 = self.viewWithTag(300 + 1) as! UITableView
                        tbvData1.reloadData()
                        let tbvData2 = self.viewWithTag(300 + 2) as! UITableView
                        tbvData2.reloadData()
                        
                        self.areaScrollView.contentSize = CGSize(width: self.frame.size.width * 3, height: self.viewContent.height - 100)
                        
                        self.titles = [a1, a2, a3]
                        self.index = 2
                        let subView = self.viewWithTag(100 + self.index) as! UIButton
                        self.lineView.center = CGPoint(x: subView.center.x , y: self.lineView.center.y)
                        self.areaScrollView.contentOffset = CGPoint(x: CGFloat(kSCREEN_WIDTH * CGFloat(subView.tag - 100)), y: 0)
                        self.titleBtnClick(sender: subView)
                        
                    }
                    
                    
                }
                
            }
        }
        
    }
    func requestProvinceList(){
        let parm = [
            "pageindex": 1,
            "paging": false
            ] as [String : Any]
        
        MJAFNetWorking.post(urlString: APIURL(APIGetProvince), parameters: parm, modelClass: CityModel.self ) { (response, error) in
            
            self.provinceArray += response as! [CityModel]
            let tbvData = self.viewWithTag(300 + 0) as! UITableView
            tbvData.reloadData()
            print("=================   \(self.provinceArray)")

            
        }
    }
    func requestDistrictList(){
        let parm1 = [
            "pageindex": 1,
            "paging": false,
            "model": ["cityid":self.cityModel?.ID]
            ] as [String : Any]
        
        MJAFNetWorking.post(urlString: APIURL(APIGetDistrict), parameters: parm1, modelClass: CityModel.self  ) { (response, error) in
            
            self.regionsArray.removeAll()
            self.regionsArray += response as! [CityModel]
            let tbvData = self.viewWithTag(300 + 2) as! UITableView
            tbvData.reloadData()
            
            self.areaScrollView.contentSize = CGSize(width: self.frame.size.width * 3, height: self.viewContent.height - 100)
            
            self.titles = [self.provinceModel?.name, self.cityModel?.name, "请选择"] as? [String]
            self.index = 2
            let subView = self.viewWithTag(100 + self.index) as! UIButton
            self.areaScrollView.contentOffset = CGPoint(x: CGFloat(kSCREEN_WIDTH * CGFloat(subView.tag - 100)), y: 0)
            self.titleBtnClick(sender: subView)
        }
    }
    
    func requestCityList(){
        let parm1 = [
            "pageindex": 1,
            "paging": false,
            "model": ["provinceid":self.provinceModel?.ID]
            ] as [String : Any]
        
        MJAFNetWorking.post(urlString: APIURL(APIGetCity), parameters: parm1, modelClass: CityModel.self  ) { (response, error) in
            
            self.cityArray.removeAll()
            self.cityArray += response as! [CityModel]
            let tbvData = self.viewWithTag(300 + 1) as! UITableView
            tbvData.reloadData()
            
            self.areaScrollView.contentSize = CGSize(width: self.frame.size.width * 3, height: self.viewContent.height - 100)
            
            self.titles = [self.provinceModel?.name, "请选择", ""] as? [String]
            self.index = 1
            let subView = self.viewWithTag(100 + self.index) as! UIButton
            self.areaScrollView.contentOffset = CGPoint(x: CGFloat(kSCREEN_WIDTH * CGFloat(subView.tag - 100)), y: 0)
            self.titleBtnClick(sender: subView)
        }
    }
    
    @objc func titleBtnClick(sender:UIButton){
        self.tempBtn.isSelected = !self.tempBtn.isSelected
        sender.isSelected = true
        self.tempBtn = sender
        
        //
        var frame: CGRect = lineView.frame
        frame.size.width = sender.frame.size.width - 20
        // scrollerView 偏移
        UIView.animate(withDuration: 0.3, animations: {
            self.lineView.frame = frame
            
            self.lineView.center = CGPoint(x: sender.center.x, y: self.lineView.center.y)
            
            self.areaScrollView.contentOffset = CGPoint(x: kSCREEN_WIDTH * CGFloat(sender.tag - 100), y: 0)
            
        }) { finished in
            
        }
        
        if pageTitleView.contentSize.width > kSCREEN_WIDTH {
            let rightOffset = CGPoint(x: pageTitleView.contentSize.width - pageTitleView.bounds.size.width, y: 0)
            pageTitleView.setContentOffset(rightOffset, animated: true)
        }

    }
    
    var titles : [String]!{
        didSet{
            
            var b_x: CGFloat = 0
            for i in 0..<titles.count {
                let subView = viewWithTag(100 + i) as! UIButton
                let str = titles[i]
                var btn_W: CGFloat = str.mj_calculateWidth(withHeight: 30, font: UIFont.mjFont(titleFont))
                if str.count > 0 {
                    btn_W += 20
                }
                subView.frame = CGRect(x: b_x, y: 0, width: btn_W, height: 50)
                b_x += btn_W
                subView.setTitle(str, for: .normal)

            }
            pageTitleView.contentSize = CGSize(width: b_x, height: 0)
            
            let selectBtn = viewWithTag(100 + index) as! UIButton
            let lineView_H: CGFloat = 2
            lineView.frame = CGRect(x: 0, y: 0, width: selectBtn.width  - 20, height: lineView_H)
            lineView.center = CGPoint(x: selectBtn.center.x , y: selectBtn.height  - lineView_H / 2)
            
        }
    }
    
    @objc func dismiss(){
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
            self.viewContent.frame = CGRect(x: 0, y: kSCREEN_HEIGHT, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT * self.scaleHeight)
            
        }) { finished in
            self.removeFromSuperview()
        }

    }
    func addSubviewsForView(){
        index = 0
        
        viewContent = UIView()
        let height: CGFloat = kSCREEN_HEIGHT * scaleHeight
        let width: CGFloat = frame.size.width
        viewContent.frame = CGRect(x: 0, y: kSCREEN_HEIGHT, width: kSCREEN_WIDTH, height: height)
        viewContent.backgroundColor = UIColor.white
        addSubview(viewContent)
        viewContent.addSubview(viewTop)
        
        viewContent.addSubview(pageTitleView)
        pageTitleView.frame = CGRect(x: 5, y: 50, width: width, height: 50)
        
        //
        viewContent.addSubview(areaScrollView)
        areaScrollView.frame = CGRect(x: 0, y: 100, width: width, height: height - 100)
    }
    func show() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.MJTheme.window
            self.viewContent.frame = CGRect(x: 0, y: kSCREEN_HEIGHT - (kSCREEN_HEIGHT * self.scaleHeight), width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT * self.scaleHeight)
            
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    //MARK: ********************************************************  懒加载
    
    lazy var viewTop : UIView = {
        let centView = UIView()
        centView.frame = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: 50)
        centView.backgroundColor = UIColor.MJTheme.bg
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: 100, height: 50))
        label.textAlignment = .left
        label.font = UIFont.mjFont(15)
        label.textColor = UIColor.rgb(102, 102, 102)
        label.text = "所在地区"
        centView.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: kSCREEN_WIDTH - 50, y: 0, width: 50, height: 50))
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.MJTheme.main, for: .normal)
        button.titleLabel?.font = UIFont.mjFont(15)
        button.addTarget(self, action: #selector(self.dismiss), for: .touchDown)
        
        centView.addSubview(button)
        
        return centView
    }()
    lazy var pageTitleView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.tag = 917
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: frame.size.width, height: 0)
        
        for i in 0..<3 {
            let button = UIButton(frame: CGRect.zero)
            button.titleLabel?.font = UIFont.mjFont(titleFont)
            button.backgroundColor = UIColor.clear
            button.setTitle("", for: UIControlState.normal)
            button.setTitleColor(UIColor.MJTheme.black, for: UIControlState.normal)//设置默认颜色
            button.setTitleColor(UIColor.MJTheme.main, for: .selected) //设置选中颜色
            button.addTarget(self, action: #selector(self.titleBtnClick), for: .touchUpInside)
            button.tag = 100 + i
            scrollView.addSubview(button)
            if i == 0 {
                button.isSelected = true
                self.tempBtn = button
            }
        }
        
        let grayView = UIView(frame: CGRect(x: 0, y: 49, width: kSCREEN_WIDTH, height: 1))
        grayView.backgroundColor = UIColor.MJTheme.bg
        scrollView.addSubview(grayView)
        
        //
        lineView = UIView(frame: CGRect.zero)
        lineView.backgroundColor = UIColor.MJTheme.main
        scrollView.addSubview(lineView)
        
        return scrollView
    }()
    lazy var tempBtn : UIButton = {
        let btn = UIButton()
        return btn
    }()
    lazy var lineView: UIView = {
        
        let view = UIView ()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    lazy var viewContent: UIView = {
        
        let view = UIView ()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    lazy var areaScrollView: UIScrollView = {
        
        let scrollView = UIScrollView ()
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.tag = 918
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: frame.size.width, height: viewContent.height - 100)
        
        for  i in 0..<3 {
        
            let area_tableView = UITableView(frame: CGRect(x: kSCREEN_WIDTH * CGFloat(i) , y: 0, width: kSCREEN_WIDTH, height: viewContent.height - 100), style: .plain)
            area_tableView.separatorStyle = .none
            area_tableView.delegate = self
            area_tableView.rowHeight = 45
            area_tableView.dataSource = self
            area_tableView.tag = 300 + i
            let cellNib = UINib(nibName: "KSimpleTitleTbvCell", bundle: nil)
            area_tableView.register(cellNib, forCellReuseIdentifier: "KSimpleTitleTbvCell")
            scrollView.addSubview(area_tableView)
        }
        
        return scrollView
    }()
    
}
extension CustomAddressView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}
extension CustomAddressView: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag - 300{
        case 0:
            return provinceArray.count
            
        case 1:
            return cityArray.count
            
        case 2:
            return regionsArray.count
            
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "KSimpleTitleTbvCell", for: indexPath) as! KSimpleTitleTbvCell
        cell.labTitle.font = UIFont.mjFont(titleFont)
        
        switch tableView.tag - 300 {
        case 0:
            let model = self.provinceArray[indexPath.row]
            cell.labTitle.text = model.name
            model.isSelect == true ? (cell.labTitle.textColor = UIColor.MJTheme.main) : (cell.labTitle.textColor = UIColor.MJTheme.black)
            
        case 1:
            let model = self.cityArray[indexPath.row]
            cell.labTitle.text = model.name
            model.isSelect == true ? (cell.labTitle.textColor = UIColor.MJTheme.main) : (cell.labTitle.textColor = UIColor.MJTheme.black)
        case 2:
        let model = self.regionsArray[indexPath.row]
        cell.labTitle.text = model.name
        model.isSelect == true ? (cell.labTitle.textColor = UIColor.MJTheme.main) : (cell.labTitle.textColor = UIColor.MJTheme.black)
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableView.tag - 300 {
        case 0:
            for model in provinceArray {
                model.isSelect = false
            }
            let model = provinceArray[indexPath.row]
            model.isSelect = true
            provinceModel = model
            
            let tbvData = viewWithTag(300 + 0) as? UITableView
            tbvData?.reloadData()
            
            requestCityList()
        case 1:
            for model in cityArray {
                model.isSelect = false
            }
            
            let model = cityArray[indexPath.row]
            model.isSelect = true
            cityModel = model
            
            let tbvData = viewWithTag(300 + 1) as? UITableView
            tbvData?.reloadData()
            
            requestDistrictList()
        case 2:
            for model in regionsArray {
                model.isSelect = false
            }
            
            let model = regionsArray[indexPath.row]
            model.isSelect = true
            districtModel = model
            
            titles = [provinceModel?.name, cityModel?.name, districtModel?.name] as? [String]
            
            let tbvData = viewWithTag(300 + 2) as? UITableView
            tbvData?.reloadData()
            
            dismiss()
            let address = "\(provinceModel?.name ?? "") \(cityModel?.name ?? "") \(districtModel?.name ?? "")"
            if confirmBlock != nil {
                confirmBlock!(address)
            }

           
        default:
            break
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let tag: Int = scrollView.tag
        print(String(format: "--222--%ld", tag))
        if tag == 918 {
            let index = Int(scrollView.contentOffset.x / kSCREEN_WIDTH)
            let subView = viewWithTag(100 + index) as! UIButton
            self.titleBtnClick(sender: subView)
        }
    }
}

