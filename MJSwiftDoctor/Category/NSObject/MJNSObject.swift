//
//  MJNSObject.swift
//  XLCustomer
//
//  Created by longma on 2019/1/14.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

extension NSObject {
    
    class func setModel(with dict:[String:Any]) -> Self {
        return self.yy_model(with: dict) ?? self.init()
    }
}
