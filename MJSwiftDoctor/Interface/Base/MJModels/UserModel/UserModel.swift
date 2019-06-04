//
//  UserModel.swift
//  XLCustomer
//
//  Created by longma on 2019/1/14.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class UserModel: MJBaseModel,NSCoding {
    
    var balance : CGFloat = 0.00
    var image : String = ""
    var onestoreid : String?
    var sex : String = "0"
    var storeid: String?
    var storename : String?
    var userid : String?
    var usermobile : String?
    var username :  String?
    var usersig :  String?
    var usersigflag :  String?

    //其他
    var mingzu :  String = "汉"
    var birthdate :  String = "1985-09-13"
    var jiehun :  Bool = true
    var ID :  String = "445201199510200033"
    var address :  String?

    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.balance, forKey: "balance")
        aCoder.encode(self.image, forKey: "image")
        aCoder.encode(self.onestoreid, forKey: "onestoreid")
        aCoder.encode(self.sex, forKey: "sex")
        aCoder.encode(self.storeid, forKey: "storeid")
        aCoder.encode(self.storename, forKey: "storename")
        aCoder.encode(self.userid, forKey: "userid")
        aCoder.encode(self.usermobile, forKey: "usermobile")
        aCoder.encode(self.username, forKey: "username")
        aCoder.encode(self.usersig, forKey: "usersig")
        aCoder.encode(self.usersigflag, forKey: "usersigflag")
        
        //
        aCoder.encode(self.mingzu, forKey: "mingzu")
        aCoder.encode(self.birthdate, forKey: "birthdate")
        aCoder.encode(self.ID, forKey: "ID")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.jiehun, forKey: "jiehun")

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.balance = (aDecoder.decodeObject(forKey: "balance") as? CGFloat) ?? 0.00
        self.image = (aDecoder.decodeObject(forKey: "image") as? String) ?? ""
        self.onestoreid = aDecoder.decodeObject(forKey: "onestoreid") as? String
        self.sex = (aDecoder.decodeObject(forKey: "sex") as? String) ?? "0"
        self.storeid = aDecoder.decodeObject(forKey: "storeid") as? String
        self.storename = aDecoder.decodeObject(forKey: "storename") as? String
        self.userid = aDecoder.decodeObject(forKey: "userid") as? String
        self.usermobile = aDecoder.decodeObject(forKey: "usermobile") as? String
        self.username = aDecoder.decodeObject(forKey: "username") as? String
        self.usersig = aDecoder.decodeObject(forKey: "usersig") as? String
        self.usersigflag = aDecoder.decodeObject(forKey: "usersigflag") as? String
        
        //
        self.mingzu = (aDecoder.decodeObject(forKey: "mingzu") as? String) ?? ""
        self.birthdate = (aDecoder.decodeObject(forKey: "birthdate") as? String) ?? ""
        self.ID = (aDecoder.decodeObject(forKey: "ID") as? String) ?? ""
        self.address = (aDecoder.decodeObject(forKey: "address") as? String) ?? ""
        self.jiehun = (aDecoder.decodeObject(forKey: "jiehun") as? Bool) ?? true

        
        
    }
    
    
}
