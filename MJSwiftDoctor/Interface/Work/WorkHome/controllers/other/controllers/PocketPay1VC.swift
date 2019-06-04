//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class PocketPay1VC: MJBasicViewController {
    var nameStr = "longma"
    var strName = "lngma,yuqian"


    @IBOutlet weak var btnCenter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.setUIAppearance()
        
        
        let name =  "{\"new\" : {\"label\" : \"新建\",\"value\" : 0},\"query\" : {\"label\" : \"查看\",\"value\" : 1}, \"edit\" : {\"label\" : \"编辑\",\"value\" : 1},\"del\" : {\"label\" : \"删除\",\"value\" : 1}}"
        
        if let parm = name.mj_stringConvertToDictionary() {
            print("=================   \(parm)")

        }
        
    }
    func setUIAppearance(){
        btnCenter.set(image: UIImage(named: "意见反馈"), title: "支付宝", titlePosition: .bottom,
                   additionalSpacing: 10.0, state: .normal)
    }


   

}
