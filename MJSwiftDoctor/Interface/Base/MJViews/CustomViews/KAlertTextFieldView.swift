//
//  KStarEvaluationView.swift
//  XLCustomer
//
//  Created by longma on 2019/5/13.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class KAlertTextFieldView: UIView {
    let viewHeight:CGFloat = 220
    var confirmBlock:((_ title:String) -> Void)?

    class func showAlertTextFieldView(completion: @escaping (_ title:String) -> Void){
        
        let keyWindow = UIApplication.shared.keyWindow
        let blackView = KAlertTextFieldView.init(frame: (keyWindow?.frame)!)
        keyWindow?.addSubview(blackView)
        blackView.confirmBlock = completion
        blackView.addSubviewsForView()
        blackView.show()
        
    }
    override init(frame: CGRect ) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        tap.delegate = self
        addGestureRecognizer(tap)

        NotificationCenter.default.addObserver(self, selector: #selector(show_Action), name: NSNotification.Name.UIKeyboardWillShow, object: nil)//键盘显示时的方法
        NotificationCenter.default.addObserver(self, selector: #selector(hide_Action), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    @objc func hide_Action(_ sender:NSNotification)
    {
        viewContent.center = self.center
    }
    @objc func show_Action(_ sender:NSNotification)
    {
        //view 向上移动
        let value = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let rect:CGRect = value.cgRectValue //获取键盘的高度
        if  rect.size.height > 50 {
            var frame: CGRect = viewContent.frame
            frame.origin.y = kSCREEN_HEIGHT - 10 - rect.size.height - viewHeight
            viewContent.frame = frame
        }
    }
    func addSubviewsForView(){
        addSubview(viewContent)
        
        viewContent.addSubview(titltLab)
        titltLab.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(viewContent).offset(15)
            make.right.top.equalTo(viewContent)
            make.height.equalTo(60)
        }
        
        viewContent.addSubview(txvRemark)
        
        viewContent.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(viewContent)
            make.left.right.equalTo(viewContent)
            make.height.equalTo(60)
        }
    }
    lazy var txvRemark: MJPlaceTextView = {
        
        let view = MJPlaceTextView(placeholder: "取消原因", placeholderColor: UIColor.lightGray, frame: CGRect(x: 15, y: 60, width: viewContent.width - 30, height: 80))
        view.backgroundColor = UIColor.rgb(246,249,250)
        view.palceholdertextView.backgroundColor = UIColor.rgb(246,249,250)
        return view
    }()
    lazy var titltLab: UILabel = {
        
        let label = UILabel ()
        label.font = UIFont.mjFont(17, isBold: true)
        label.text = "确认取消该订单吗？"
        label.textColor = UIColor.MJTheme.black
        
        return label
    }()
    lazy var bottomView: KAverageBottomView = {
        let view = Bundle.main.loadNibNamed("KAverageBottomView", owner: self, options: nil)?.last as! KAverageBottomView
        view.btnLeft.setTitle("取消", for: .normal)
        view.btnRight.setTitle("确定", for: .normal)
        view.btnLeft.addAction({ (btn) in
            self.dismiss()
        })
        view.btnRight.addAction({ (btn) in
            self.dismiss()
            if self.confirmBlock != nil{
                self.confirmBlock!(self.txvRemark.palceholdertextView.text)
            }
        })
        return view
    }()
    lazy var viewContent: UIView = {
        
        let view = UIView ()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(x: 30, y: 0, width: kSCREEN_WIDTH - 60, height: viewHeight)
        view.center = self.center;
        view.setCornerRadius(kViewRadius)

        return view
    }()
    @objc func dismiss(){
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.rgb(0, 0, 0, transparency: 0)
            self.viewContent.alpha = 0
            
        }) { finished in
            self.removeFromSuperview()
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    func show(){
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.MJTheme.window
            self.viewContent.alpha = 1
            
        }) { finished in
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension KAlertTextFieldView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}
