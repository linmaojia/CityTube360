//
//  MJTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/8.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJTbvCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUIAppearance()
    }

    func setUIAppearance(){
        
    }
   
    override var frame: CGRect{
        didSet{
            var f: CGRect = frame
            f.origin.x = kViewSpace
            f.size.width = frame.size.width - kViewSpace * 2
            super.frame = f
        }
    }
}
