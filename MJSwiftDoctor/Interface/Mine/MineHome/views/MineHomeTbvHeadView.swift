//
//  MJSampleTbvHeadView.swift
//  XLCustomer
//
//  Created by longma on 2019/1/4.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

protocol MineHomeTbvHeadViewDelegate: class {
    func didSelectItem(text:String)
}


class MineHomeTbvHeadView: MJTbvColorHeadView {

    weak var delegate:MineHomeTbvHeadViewDelegate?

    @IBOutlet weak var imvHeadLayoutH: NSLayoutConstraint!
    @IBOutlet weak var imvHeadLayoutW: NSLayoutConstraint!
    @IBOutlet weak var viewTopLayoutWH: NSLayoutConstraint!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var labMoney: UILabel!
    @IBOutlet weak var labLeft: UILabel!
    @IBOutlet weak var labRight: UILabel!
    @IBOutlet weak var labDay: UILabel!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var imvHead: UIImageView!
    @IBOutlet weak var viewBottom: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labLeft.setBorder(color: UIColor.MJTheme.main, width: 1)
        labLeft.cornerRadius = 10
        labRight.setBorder(color: UIColor.MJTheme.main, width: 1)
        labRight.cornerRadius = 10

        viewBottom.setShadow(sColor: UIColor.MJTheme.shadow, offset: kViewSOffset, radius: 6, sRadius: 4)
        
        imvHeadLayoutH.constant = AUTO_MATE_WIDTH(width: 60)
        imvHeadLayoutW.constant = AUTO_MATE_WIDTH(width: 60)
        imvHead.cornerRadius = AUTO_MATE_WIDTH(width: 60)/2
        
        imvHead.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action:#selector(actionHeadClick))
        imvHead.addGestureRecognizer(tap)
        
        labName.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action:#selector(actionHeadClick))
        labName.addGestureRecognizer(tap1)
     
    }
    @objc func actionHeadClick() {
        self.delegate?.didSelectItem(text: "头像")
    }
    @IBAction func actionDetail(_ sender: Any) {
        self.delegate?.didSelectItem(text: labLeft.text!)
    }
    @IBAction func actionChong(_ sender: Any) {
        self.delegate?.didSelectItem(text: labRight.text!)
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()

        viewTop.layoutIfNeeded()
        viewTop.setGradientLayer(colors: [UIColor.rgb(8,208,235).cgColor,UIColor.rgb(77,138,221).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1))
    }
}
