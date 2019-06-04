//
//  MJTbvColorHeadView.swift
//  XLCustomer
//
//  Created by longma on 2019/1/8.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJTbvColorHeadView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let underView = UIView(frame: CGRect(x: 0, y: -3000, width: kSCREEN_WIDTH, height: 3000))
        underView.backgroundColor = UIColor.rgb(8,208,235)
        insertSubview(underView, at: 0)
    }

}
