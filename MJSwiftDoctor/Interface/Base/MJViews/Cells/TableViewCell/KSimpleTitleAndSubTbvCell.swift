//
//  KSimpleTitleAndSubTbvCell.swift
//  XLCustomer
//
//  Created by longma on 2019/1/31.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class KSimpleTitleAndSubTbvCell: UITableViewCell {
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var labSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labTitle.textColor = UIColor.MJTheme.dark
        labTitle.font = UIFont.mjFont(15)
        labSubTitle.font = UIFont.mjFont(14)
    }
    
    var subTitle : String!{
        didSet{

            self.labSubTitle.text = subTitle
            self.labSubTitle.textColor = UIColor.MJTheme.gray

//            if subTitle == "请选择"{
//                self.labSubTitle.textColor = UIColor.MJTheme.gray
//            }else{
//                self.labSubTitle.textColor = UIColor.MJTheme.black
//            }
            
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
