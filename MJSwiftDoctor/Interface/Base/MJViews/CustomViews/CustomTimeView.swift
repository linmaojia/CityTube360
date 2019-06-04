//
//  CustomTypeView.swift
//  XLCustomer
//
//  Created by longma on 2019/4/1.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

enum TIMETYPE : Int {
    
    case timeTypeDate
    
    case timeTypeTime
    
    case timeTypeCountDownTimer
    
}


class CustomTimeView: UIView {
    var viewHeight:CGFloat = 160
    var scaleHeight:CGFloat = 0.4
    
    var confirmBlock:((_ date:Date) -> Void)?
    var timeStr:String?
    var timeType:TIMETYPE = .timeTypeDate
    
    class func showCustomTime(timeStr:String?,timeType:TIMETYPE ,completion: @escaping (_ date:Date) -> Void){
        let keyWindow = UIApplication.shared.keyWindow
        let blackView = CustomTimeView.init(frame: (keyWindow?.frame)!)
        keyWindow?.addSubview(blackView)
        blackView.confirmBlock = completion
        blackView.timeStr = timeStr
        blackView.timeType = timeType
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
        viewContent.addSubview(datePicker)
        
    }
    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker ()
        datePicker.frame = CGRect(x: 0, y: 50 , width: kSCREEN_WIDTH, height: viewContent.height - 50 )
        switch timeType {
        case .timeTypeDate :
            datePicker.datePickerMode = .date
            let locale = Locale.init(identifier: "zh_CN")
            datePicker.locale = locale
            if timeStr != nil {
                datePicker.setDate((timeStr?.mj_date(withFormat: "yyyy/MM/dd"))!, animated: false)
            }

        case .timeTypeTime:
            datePicker.datePickerMode = .time
            if timeStr != nil {
                datePicker.setDate((timeStr?.mj_date(withFormat: "HH:mm"))!, animated: false)
            }

        case .timeTypeCountDownTimer:
            datePicker.datePickerMode = .countDownTimer
            let locale = Locale.init(identifier: "zh_CN")
            datePicker.locale = locale
            if timeStr != nil {
                datePicker.setDate((timeStr?.mj_date(withFormat: "HH:mm"))!, animated: false)
            }
        }
        
        return datePicker
    }()
    lazy var viewTop: UIView = {
        
        let view = UIView ()
        view.frame = CGRect(x: 0, y: 0 , width: kSCREEN_WIDTH, height: 50 )
        view.backgroundColor = UIColor.MJTheme.bg
        
        let button1 = UIButton ()
        button1.frame = CGRect(x: 0, y: 0 , width: 50, height: 50 )
        button1.setTitle("取消", for: .normal)
        button1.setTitleColor(UIColor.MJTheme.gray, for: .normal)
        button1.titleLabel?.font = UIFont.mjFont(15)
        button1.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        view.addSubview(button1)
        
        let button = UIButton ()
        button.frame = CGRect(x: viewContent.width - 50, y: 0 , width: 50, height: 50 )
        button.setTitle("确定", for: .normal)
        button.setTitleColor(UIColor.MJTheme.main, for: .normal)
        button.titleLabel?.font = UIFont.mjFont(15)
        button.addTarget(self, action: #selector(actionConfirm), for: .touchUpInside)
        view.addSubview(button)
        
        return view
    }()
    
    
    @objc func actionConfirm() {
        if confirmBlock != nil {
            confirmBlock!(self.datePicker.date)
        }
        self.dismiss()
        
    }
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
extension CustomTimeView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}

