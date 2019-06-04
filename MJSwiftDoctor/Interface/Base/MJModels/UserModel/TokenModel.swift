//
//  UserModel.swift
//  XLCustomer
//
//  Created by longma on 2019/1/14.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit


class TokenModel: MJBaseModel,NSCoding {

    var access_token : String?
    var expires_in : Int = 0
    var refresh_token : String?
    var issued_utc : Int = 0
    var token_type : String?
  
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.access_token, forKey: "access_token")
        aCoder.encode(self.expires_in, forKey: "expires_in")
        aCoder.encode(self.refresh_token, forKey: "refresh_token")
        aCoder.encode(self.issued_utc, forKey: "issued_utc")
        aCoder.encode(self.token_type, forKey: "token_type")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        self.access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        self.expires_in = (aDecoder.decodeObject(forKey: "expires_in") as? Int) ?? 0
        self.refresh_token = aDecoder.decodeObject(forKey: "refresh_token") as? String
        self.issued_utc = (aDecoder.decodeObject(forKey: "issued_utc") as? Int) ?? 0
        self.token_type = aDecoder.decodeObject(forKey: "token_type") as? String

    }
    
    
}
