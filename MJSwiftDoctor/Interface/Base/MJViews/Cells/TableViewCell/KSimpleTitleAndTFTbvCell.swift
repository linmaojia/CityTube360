//
//  KSimpleTitleTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/2.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class KSimpleTitleAndTFTbvCell: UITableViewCell {

    @IBOutlet weak var imvRight: UIImageView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var labTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.labTitle.font = UIFont.mjFont(15)
        self.tfTitle.font = UIFont.mjFont(14)
        self.tfTitle.textColor = UIColor.MJTheme.gray
        self.tfTitle.setPlaceHolderTextColor(UIColor.MJTheme.gray)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
