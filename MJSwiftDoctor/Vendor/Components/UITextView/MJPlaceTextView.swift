//
//  PlaceholderTextView.swift
//  PlaceholderTextView
//
//  Created by Nvr on 2018/10/19.
//  Copyright © 2018年 张宇. All rights reserved.
//

import UIKit



class MJPlaceTextView: UIView {
    let space:CGFloat = 15

    //MARK: - 懒加载属性
    lazy var countLabel = UILabel()
    lazy var plaleLabel: UILabel = {
        
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = UIColor.lightGray
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    lazy var palceholdertextView: UITextView = {
        
        let view = UITextView.init()
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = UIColor.MJTheme.black
        view.delegate = self
        view.addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions.new, context: nil)

        return view
    }()
    

    
    //储存属性
    @objc var placeholderGlobal:String?{      //提示文字
        didSet{
            plaleLabel.text = placeholderGlobal
            plaleLabel.sizeToFit()
        }
    }
    @objc var placeholderColorGlobal:UIColor?{
        didSet{
            plaleLabel.textColor = placeholderColorGlobal
        }
    }
    @objc var isReturnHidden:Bool = false     //是否点击返回失去响应
    @objc var isShowCountLabel:Bool = false { //是否显示计算个数的Label
        didSet{
            countLabel.isHidden = !isShowCountLabel
        }
    }
    @objc var limitWords:UInt = 1000             //限制输入个数   默认为999999，不限制输入
    
    //MARK: - 系统方法
    /// PlaceholerTextView 唯一初始化方法
    convenience init(placeholder:String?,placeholderColor:UIColor?,frame: CGRect) {
        self.init(frame: frame)
        setup(placeholder: placeholder, placeholderColor: placeholderColor)
        placeholderGlobal = placeholder
        placeholderColorGlobal = placeholderColor
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }
    
    //XIB 调用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(placeholder: nil, placeholderColor: nil)
    }
    
    deinit {
        self.palceholdertextView.removeObserver(self, forKeyPath: "text")
    }
    
}

//MARK: - 自定义UI
extension MJPlaceTextView{
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "text" {
            self.checkShowHiddenPlaceholder()
        }
        
    }
    
    /// placeholder Label Setup
    private func setup(placeholder:String?,placeholderColor:UIColor?){
        
        palceholdertextView.frame = CGRect(x: space, y: space, width: self.frame.width - space*2, height: self.frame.height - space*2)
        self.addSubview(palceholdertextView)
        palceholdertextView.textContainerInset = UIEdgeInsetsMake(0, -3, 0, 0); //调整内边距，光标位置

        
        plaleLabel.text = placeholder
        self.addSubview(plaleLabel)
        let height = placeholder?.mj_calculateHeigh(withWidth: self.frame.width - space*2, font: plaleLabel.font, lineSpacing: 0)
        plaleLabel.frame = CGRect(x: space, y: space, width: self.frame.width - space*2, height: height ?? 17)
        
//        countLabel.font = palceholdertextView.font
//        addSubview(countLabel)
    }
    
    
}

//MARK: - UITextViewDelegate代理方法
extension MJPlaceTextView : UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        checkShowHiddenPlaceholder()
        countLabel.text = "\(textView.text.count)/\(limitWords)"
        countLabel.sizeToFit()
        countLabel.frame.origin = CGPoint(x: frame.width-countLabel.frame.width-10, y: frame.height-countLabel.frame.height-5)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text=="\n"&&isReturnHidden==true {
            textView.resignFirstResponder()
        }
        
        //大于等于限制字数，而且不是删除键的时候不可以输入。
        if range.location+range.length >= limitWords && !(text as NSString).isEqual(to: ""){
            return false
        }
        
        return true
    }
    
    
}


//MARK : - 工具方法

extension MJPlaceTextView {
    
    ///根据textView是否有内容显示placeholder
    private func checkShowHiddenPlaceholder(){
        if self.palceholdertextView.hasText {
            plaleLabel.text = nil
            countLabel.isHidden = false
        }else{
            plaleLabel.text = placeholderGlobal
            countLabel.isHidden = true
        }
    }
    
}
