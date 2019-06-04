//
//  KStarEvaluationView.swift
//  XLCustomer
//
//  Created by longma on 2019/5/13.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class KAlertTitleView: UIView {
    let viewHeight:CGFloat = AUTO_MATE_5_WIDTH(width: 150)
    var confirmBlock:(() -> Void)?
    var title:String?

    class func showAlertTitleView(title:String, completion: @escaping () -> Void){
        
        let keyWindow = UIApplication.shared.keyWindow
        let blackView = KAlertTitleView.init(frame: (keyWindow?.frame)!)
        keyWindow?.addSubview(blackView)
        blackView.confirmBlock = completion
        blackView.title = title
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
      
    }
   
   
    func addSubviewsForView(){
        addSubview(viewContent)
        
        viewContent.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(viewContent)
            make.left.right.equalTo(viewContent)
            make.height.equalTo(50)
        }
        
        viewContent.addSubview(titltLab)
        titltLab.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(viewContent)
            make.top.equalTo(viewContent)
            make.bottom.equalTo(bottomView.snp.top)
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
        label.font = UIFont.mjFont(17, isBold: false)
        label.text = self.title
        label.textColor = UIColor.MJTheme.black
        label.textAlignment = .center
        
        return label
    }()
    lazy var bottomView: KEqualityBottomView = {
        let view = Bundle.main.loadNibNamed("KEqualityBottomView", owner: self, options: nil)?.last as! KEqualityBottomView
        view.btnLeft.setTitle("取消", for: .normal)
        view.btnRight.setTitle("确定", for: .normal)
        view.btnLeft.addAction({ [weak self] (btn) in
            self?.dismiss()
        })
        view.btnRight.addAction({ [weak self] (btn) in
            self?.dismiss()

            if self?.confirmBlock != nil {
                self?.confirmBlock!()
            }
            
        })
        return view
    }()
    lazy var viewContent: UIView = {
        
        let view = UIView ()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH - 60, height: viewHeight)
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
      
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension KAlertTitleView:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view?.isDescendant(of: viewContent) ?? false {
            return false
        }
        return true
    }
}
