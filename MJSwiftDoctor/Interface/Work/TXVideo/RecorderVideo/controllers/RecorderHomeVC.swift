//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class RecorderHomeVC: MJBasicViewController {
    @IBOutlet weak var preview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }
    func setUIAppearance(){
        
    }

    //MARK: **************************** 懒加载

    @IBAction func actionRecorder(_ sender: Any) {
        self.pushViewController(targetStr: "RecorderVideoVC")

    }
    
}

