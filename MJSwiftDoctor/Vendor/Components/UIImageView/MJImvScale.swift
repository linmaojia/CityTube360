//
//  MJLabelPadding.swift
//  XLCustomer
//
//  Created by longma on 2019/1/15.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MJImvScale: UIImageView {

    
    /// 设配宽高
    @IBInspectable  var kWidth: CGFloat = 0
    @IBInspectable  var kHeight: CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if kWidth > 0 {
            self.width = AUTO_MATE_GT_WIDTH(width: kWidth)
        }
        if kHeight > 0 {
            self.height = AUTO_MATE_GT_WIDTH(width: kHeight)
        }
    }
   
    
}
