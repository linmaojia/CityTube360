//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit

//MARK: ********************************************************  IB
extension UIView {
    @IBInspectable public var bgColorName: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.backgroundColor = UIColor.MJTheme.color(with: newValue)
            }
            
        }
    }
}
//MARK: ********************************************************  MJImageCliped
extension UIView {
    
    /// 设置view的圆角
    ///
    /// - Parameter radius: 圆角半径
    func setCornerRadius(_ radius: CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    /// 给控件本身添加圆角
    ///
    /// - Parameters:
    ///   - corner: 添加哪些圆角
    ///   - cornerRadius: 圆角半径
    ///   - targetSize: 目标大小，即控件的frame.size
    func setCorner(_ corner: UIRectCorner, cornerRadius: CGFloat, size targetSize: CGSize) {
        let frame = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let layer = CAShapeLayer()
        layer.frame = frame
        layer.path = path.cgPath
        
        self.layer.mask = layer
    }
    
    /// 给控件本身添加圆角
    ///
    /// - Parameters:
    ///   - cornerRadius: 圆角半径
    ///   - corner: 添加哪些圆角
    func setCorner(cornerRadius: CGFloat, corner: UIRectCorner = .allCorners) {
        
        setCorner(corner, cornerRadius: cornerRadius, size: bounds.size)
    }


}
//MARK: ********************************************************  UI
extension UIView {
    
    
    /// 设置渐变
    ///
    /// - Parameters:
    ///   - colors: 渐变数组
    ///   - startPoint: 开始坐标
    ///   - endPoint: 结束坐标
    func setGradientLayer(colors:[CGColor],startPoint:CGPoint,endPoint:CGPoint,locations:[NSNumber] = [0.5]){
        removeGradientLayer()
        
        let gradientLayer = CAGradientLayer() //MJ渐变
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors // 设置
//        gradientLayer.locations = locations // 颜色分割线 0.5后开始渐变
        gradientLayer.startPoint = startPoint //Z
        gradientLayer.endPoint = endPoint //
        self.layer.insertSublayer(gradientLayer, at: 0)

    }
    // MARK: 移除渐变图层
    // （当希望只使用backgroundColor的颜色时，需要先移除之前加过的渐变图层）
    public func removeGradientLayer() {
        if let sl = self.layer.sublayers {
            for layer in sl {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    /// 设置阴影 圆角 （对于没有子视图的控件,有子视图时不会切圆角）
    ///
    /// - Parameters:
    ///   - sColor: 阴影颜色
    ///   - offset: 阴影偏移量
    ///   - opacity: 透明度
    ///   - radius: layer半径
    ///   - sRadius: 阴影半径
    ///   - rectCorner: 4角
    func setShaowAndConner(sColor:UIColor,offset:CGSize = .init(width: 0, height: 0),opacity:Float = 1,radius:CGFloat,sRadius:CGFloat,rectCorner:UIRectCorner = .allCorners){
        
        //设置圆角
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        //设置阴影
        self.layer.shadowColor = sColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = sRadius
        self.clipsToBounds = false
        
    }
    /// 设置阴影 UIView
    ///
    /// - Parameters:
    ///   - sColor: 阴影颜色 只有UIView 才有用
    ///   - offset: 阴影偏移量
    ///   - opacity: 透明度
    ///   - radius: layer半径
    ///   - sRadius: 阴影半径
    ///   - width: 边框宽度
    ///   - bColor: 边框颜色
    func setShadow(sColor:UIColor,offset:CGSize,opacity:Float = 1,radius:CGFloat,sRadius:CGFloat,width:CGFloat = 0.0001,bColor:UIColor = UIColor.white,subviewCorner:Bool = true) {
        self.backgroundColor = bColor
        //设置视图边框宽度
        self.layer.borderWidth = width
        //设置边框颜色
        self.layer.borderColor = sColor.cgColor
        //设置边框圆角
        self.layer.cornerRadius = radius

        //设置阴影颜色
        self.layer.shadowColor = sColor.cgColor
        //设置透明度 ，默认为0，不设置则不会显示阴影****
        self.layer.shadowOpacity = opacity
        //设置阴影半径
        self.layer.shadowRadius = sRadius
        //设置阴影偏移量
        self.layer.shadowOffset = offset
        
        if subviewCorner{
            //设置子视图圆角
            for view in self.subviews {
                view.cornerRadius = radius
            }
        }
        
        
    }
    
    /// 设置边框
    ///
    /// - Parameters:
    ///   - color: 边框颜色
    ///   - width: 边框宽度
    func setBorder(color:UIColor,width:CGFloat = 1){
        self.borderWidth = width
        self.borderColor = color
    }
}
//MARK: ********************************************************  frame
 extension UIView {
    
    //获取视图的X坐标
    public var x:CGFloat{
        get{
            return self.frame.origin.x;
        }
        
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的Y坐标
    public var y:CGFloat{
        get{
            return self.frame.origin.y;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的宽
    public var width:CGFloat{
        get{
            return self.frame.size.width;
        }
        
        set{
            var frames = self.frame;
            frames.size.width = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的高
    public var height:CGFloat{
        get{
            return self.frame.size.height;
        }
        
        set{
            var frames = self.frame;
            frames.size.height = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    // top
    var top:CGFloat {
        get {
            return frame.minY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // bottom
    var bottom:CGFloat {
        get {
            return frame.maxY
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // left
    var left:CGFloat {
        get {
            return frame.minX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // right
    var right:CGFloat {
        get {
            return frame.maxX
        }
        set(newValue) {
            var tempFrame:CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
  
    
    
    //获取最大的X坐标
    public var maxX:CGFloat{
        get{
            return self.x + self.width;
        }
        
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue - self.width);
            self.frame = frames;
        }
    }
    
    //获取最大的Y坐标
    public var maxY:CGFloat{
        get{
            return self.y + self.height;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue - self.height);
            self.frame = frames;
        }
    }
    
    //中心点X坐标
    public var centerX:CGFloat{
        get{
            return self.center.x;
        }
        set{
            self.center = CGPoint(x:CGFloat(newValue),y:self.center.y);
        }
    }
    
    //中心点Y坐标
    public var centerY:CGFloat{
        get{
            return self.center.y;
        }
        set{
            self.center = CGPoint(x:self.center.x,y:CGFloat(newValue));
        }
    }
    
    
    /// 删除所有的子视图
    func removeAllSubView() -> Void {
        for view : UIView in self.subviews{
            view.removeFromSuperview();
        }
    }
    
    ///加载XIB文件
    public class func initWithXibName(xib:String) -> Any? {
        guard let nibs:Array = Bundle.main.loadNibNamed(xib, owner: nil, options: nil)else{
            return nil;
        }
        return nibs[0] ;
    }
    
    //设置边框
    func setBoardWithColor(color:UIColor,top:Bool,right:Bool,bottom:Bool,left:Bool,width:CGFloat) -> Void {
        if top == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if right == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: self.width - width, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if bottom == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: self.height - width, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if left == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
    }
    
    
}




