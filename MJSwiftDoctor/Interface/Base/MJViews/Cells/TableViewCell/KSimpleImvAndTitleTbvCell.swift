//
//  KSimpleTitleTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/2.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class KSimpleImvAndTitleTbvCell: MJTbvCell {
    @IBOutlet weak var imvIconW: NSLayoutConstraint!
    
    @IBOutlet weak var imvIconH: NSLayoutConstraint!
    @IBOutlet weak var imvRight: UIImageView!
    
    @IBOutlet weak var imvRightH: NSLayoutConstraint!
    @IBOutlet weak var imvRightW: NSLayoutConstraint!
    @IBOutlet weak var viewBgLayoutTop: NSLayoutConstraint!
    @IBOutlet weak var viewBgLayoutBottom: NSLayoutConstraint!
    @IBOutlet weak var viewBg: UIView!
    var isCornerRadius:Bool = false
    var topCornerRadius:Bool = false //是否底部圆角
    var bottomCornerRadius:Bool = false  //是否底部圆角

    @IBOutlet weak var imvIcon: UIImageView!
    @IBOutlet weak var labTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imvIcon.contentMode = .scaleAspectFit
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isCornerRadius{
            self.setCorner(cornerRadius: kViewRadius)
        }
        if topCornerRadius{
            self.setCorner(cornerRadius: kViewRadius, corner: [.topLeft,.topRight])
        }
        if bottomCornerRadius{
            self.setCorner(cornerRadius: kViewRadius, corner: [.bottomLeft,.bottomRight])
        }

    }
}

