//
//  CustomTypeView.swift
//  XLCustomer
//
//  Created by longma on 2019/4/1.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class CustomItemView: UIView {
    var viewHeight:CGFloat = 160
    var scaleHeight:CGFloat = 0.5

    var confirmBlock:((_ index:Int) -> Void)?
    var dataArray = [String]()
    var title:String?
    
    class func showCustomItemWithArr(dataArray:[String],title:String,scaleHeight:CGFloat = 0.6, completion: @escaping (_ index:Int) -> Void){
        let keyWindow = UIApplication.shared.keyWindow
        let blackView = CustomItemView.init(frame: (keyWindow?.frame)!)
        keyWindow?.addSubview(blackView)
        blackView.confirmBlock = completion
        blackView.dataArray = dataArray
        blackView.title = title
        blackView.scaleHeight = scaleHeight
        blackView.addSubviewsForView()
        blackView.show()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    func addSubviewsForView(){
        self.viewHeight = CGFloat(kSCREEN_HEIGHT * self.scaleHeight)
        addSubview(viewContent)
        viewContent.addSubview(viewTop)
        viewContent.addSubview(tbvData)

    }
    lazy var tbvData: UITableView = {
        
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.frame = CGRect(x: 0, y: viewTop.height , width: kSCREEN_WIDTH, height: viewContent.height - viewTop.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 50
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.tableFooterView = UIView.init(frame: .zero);
        tableView.separatorColor = UIColor.MJTheme.border
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.isScrollEnabled = false

        let cell = UINib.init(nibName: "KSimpleTitleTbvCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "KSimpleTitleTbvCell")
        return tableView
    }()
    lazy var viewTop: UIView = {
        
        let view = UIView ()
        view.frame = CGRect(x: 0, y: 0 , width: kSCREEN_WIDTH, height: 50 )
        view.backgroundColor = UIColor.MJTheme.bg
        let label = UILabel ()
        label.frame = CGRect(x: 10, y: 0 , width: 100, height: 50 )
        label.textAlignment = .left
        label.font = UIFont.mjFont(15)
        label.textColor = UIColor.MJTheme.gray
        label.text = self.title
        view.addSubview(label)
        
        let button = UIButton ()
        button.frame = CGRect(x: viewContent.width - 50, y: 0 , width: 50, height: 50 )
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.MJTheme.main, for: .normal)
        button.titleLabel?.font = UIFont.mjFont(15)
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        view.addSubview(button)

        return view
    }()
    
    
    func show() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.MJTheme.window
            self.viewContent.frame = CGRect(x: 0, y: kSCREEN_HEIGHT - self.viewHeight , width: kSCREEN_WIDTH, height: self.viewHeight )
            
        })
    }
    @objc func dismiss(){
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
            self.viewContent.frame = CGRect(x: 0, y: kSCREEN_HEIGHT, width: kSCREEN_WIDTH, height: self.viewHeight)
            
        }) { finished in
            self.removeFromSuperview()
        }
        
    }
    lazy var viewContent: UIView = {
        
        let view = UIView ()
        view.backgroundColor = UIColor.rgb(236, 236, 236)
        view.frame = CGRect(x: 0, y: kSCREEN_HEIGHT, width: kSCREEN_WIDTH, height: viewHeight)
        return view
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomItemView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}

extension CustomItemView: UITableViewDelegate, UITableViewDataSource {
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "KSimpleTitleTbvCell", for: indexPath) as! KSimpleTitleTbvCell
        cell.labTitle.text = dataArray[indexPath.row]
        cell.labTitle.textAlignment = .center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if confirmBlock != nil{
            confirmBlock!(indexPath.row)
        }
        self.dismiss()
    }
}
