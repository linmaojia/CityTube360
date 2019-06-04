//
//  MJTIMConversation.swift
//  XLCustomer
//
//  Created by longma on 2019/1/14.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class CityModel: MJBaseModel {

    var ID: String = ""
    var name:String = ""
    var isSelect:Bool = false

    class func modelCustomPropertyMapper() -> [String:String]{
        return ["ID" : "id"]
    }
  
}
