//
//  ViewController.swift
//  XLCustomer
//
//  Created by longma on 2018/10/16.
//  Copyright © 2018年 XLH. All rights reserved.
//

import UIKit
import SwifterSwift
class ViewController: MJBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(titltLab)
//        titltLab.mj_paragraphStyleWithArrString(arrString: ["longma"], font: nil, color: UIColor.blue)
        titltLab.snp.makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
        }

        titltLab.backgroundColor = titltLab.backgroundColor?.mj_colorWithAlpha(customAlpha: 0.5)
    }
    lazy var titltLab: MJLabelPadding = {
        
        let label = MJLabelPadding ()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "label longma所发生的方式水电费第三方是发送到发"
        label.backgroundColor = UIColor.MJTheme.main
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

