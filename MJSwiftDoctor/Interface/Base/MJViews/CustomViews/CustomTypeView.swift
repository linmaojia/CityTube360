//
//  CustomTypeView.swift
//  XLCustomer
//
//  Created by longma on 2019/4/1.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class CustomTypeView: UIView {
    var viewHeight:CGFloat = 160

    var confirmBlock:((_ index:Int) -> Void)?
    var dataArray = [String]()
    class func showCustomTypeWithArr(dataArray:[String], completion: @escaping (_ index:Int) -> Void){
        let keyWindow = UIApplication.shared.keyWindow
        let blackView = CustomTypeView.init(frame: (keyWindow?.frame)!)
        keyWindow?.addSubview(blackView)
        blackView.confirmBlock = completion
        blackView.dataArray = dataArray
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
        self.viewHeight = CGFloat(self.dataArray.count * 50 + 60)
        addSubview(viewContent)
        viewContent.addSubview(btnCancel)
        viewContent.addSubview(tbvData)

    }
    lazy var tbvData: UITableView = {
        
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.frame = CGRect(x: 0, y: 0 , width: kSCREEN_WIDTH, height: viewContent.height - btnCancel.height - 10)
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
    lazy var btnCancel: UIButton = {
        
        let button = UIButton ()
        button.frame = CGRect(x: 0, y: viewContent.height - 50 , width: kSCREEN_WIDTH, height: 50 )
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.MJTheme.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        return button
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
extension CustomTypeView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}

extension CustomTypeView: UITableViewDelegate, UITableViewDataSource {
   
    
    
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
