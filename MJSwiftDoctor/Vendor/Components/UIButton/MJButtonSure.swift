//
//  MJLabelPadding.swift
//  XLCustomer
//
//  Created by longma on 2019/1/15.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJButtonSure: UIButton {

    
    @IBInspectable var bgColorType : String!{
        didSet{

            switch bgColorType{
            case "red":
                print("===========2======   ")

                self.setGradientLayer(colors: [UIColor.rgb(254,113,113).cgColor,UIColor.rgb(255,85,85).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
            case "gray":
                self.setGradientLayer(colors: [UIColor.rgb(184,196,199).cgColor,UIColor.rgb(158,168,171).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
            default:
                self.setGradientLayer(colors: [UIColor.rgb(86,209,246).cgColor,UIColor.rgb(22,175,220).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setCornerRadius(kViewRadius)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.isEnabled = false
        self.setGradientLayer(colors: [UIColor.rgb(229,234,236).cgColor,UIColor.rgb(214,222,224).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.setCornerRadius(kViewRadius)
        
        print("===========1======   ")

     

    }
    var isClickEnabled : Bool!{
        
        didSet{
            self.isEnabled = isClickEnabled

            if isClickEnabled {
                self.setGradientLayer(colors: [UIColor.rgb(86,209,246).cgColor,UIColor.rgb(22,175,220).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
            }else{
                self.setGradientLayer(colors: [UIColor.rgb(229,234,236).cgColor,UIColor.rgb(214,222,224).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
            }
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
   
    
}
