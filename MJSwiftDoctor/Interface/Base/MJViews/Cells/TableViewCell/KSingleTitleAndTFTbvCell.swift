//
//  KSimpleTitleTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/2.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class KSingleTitleAndTFTbvCell: UITableViewCell {

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var labTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.labTitle.font = UIFont.mjFont(16)
        self.tfTitle.font = UIFont.mjFont(16)
        self.tfTitle.textColor = UIColor.MJTheme.black
        self.tfTitle.clearButtonMode = .whileEditing
        self.tfTitle.setPlaceHolderTextColor(UIColor.MJTheme.gray)
        self.tfTitle.isSecureTextEntry = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
