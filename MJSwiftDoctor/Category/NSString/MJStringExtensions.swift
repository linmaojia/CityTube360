//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit
import CoreFoundation
 extension String {
    
    
    //MARK: ********************************************************  加密
    func mj_stringConvertToUrlEncode() -> String {
        
        let unencodedString = self
        let encodedString = CFBridgingRetain(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, unencodedString as CFString?, nil, "!*'();:@&=+$,/?%#[]" as CFString?, CFStringBuiltInEncodings.UTF8.rawValue)) as? String
        
        return encodedString ?? ""
    }

    
    func mj_hmacsha1(algorithm: HMACAlgorithm, key: String) -> String {
        let cKey = key.cString(using: .utf8)
        let cData = self.cString(using: .utf8)
        var result = [CUnsignedChar](repeating: 0, count: Int(algorithm.digestLength()))
        CCHmac(algorithm.toCCHmacAlgorithm(), cKey!, strlen(cKey!), cData!, strlen(cData!), &result)
        let hmacData:NSData = NSData(bytes: result, length: (Int(algorithm.digestLength())))
        let hmacBase64 = hmacData.base64EncodedString(options: .lineLength76Characters)
        
        return String(hmacBase64)
    }
    enum HMACAlgorithm {
        case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
        
        func toCCHmacAlgorithm() -> CCHmacAlgorithm {
            var result: Int = 0
            switch self {
            case .MD5:
                result = kCCHmacAlgMD5
            case .SHA1:
                result = kCCHmacAlgSHA1
            case .SHA224:
                result = kCCHmacAlgSHA224
            case .SHA256:
                result = kCCHmacAlgSHA256
            case .SHA384:
                result = kCCHmacAlgSHA384
            case .SHA512:
                result = kCCHmacAlgSHA512
            }
            return CCHmacAlgorithm(result)
        }
        
        func digestLength() -> Int {
            var result: CInt = 0
            switch self {
            case .MD5:
                result = CC_MD5_DIGEST_LENGTH
            case .SHA1:
                result = CC_SHA1_DIGEST_LENGTH
            case .SHA224:
                result = CC_SHA224_DIGEST_LENGTH
            case .SHA256:
                result = CC_SHA256_DIGEST_LENGTH
            case .SHA384:
                result = CC_SHA384_DIGEST_LENGTH
            case .SHA512:
                result = CC_SHA512_DIGEST_LENGTH
            }
            return Int(result)
        }
    }

    
    /// aes 123 加密
    var mj_aes128: String{
        do {
            let aes = try AES.init(key: kAesKey, iv: kAesVector)
            
            let encrypted = try aes.encrypt(self.bytes)
            
            print("加密结果(base64)：\(encrypted.toBase64()!)")
            
            return encrypted.toBase64()!
        } catch { }
        
        return "M"
    }
    //MARK: ********************************************************  字符串操作
   
    
    //MARK: ******************************************************** 字符串转换
    func mj_stringConvertToDictionary() -> [String : Any]? {
        
        let jsonData: Data? = data(using: .utf8)
        var dic: [String : Any]? = nil
        if let jsonData = jsonData {

            dic = try! JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String : Any]
            
        }
        
        return dic
    }
    
    
    /// 字符串转 URl (转码成UTf_8)
    ///
    /// - Returns:  url 地址
    var mj_url: URL{
        
        let trimPath = self.removingPercentEncoding
        if let url = URL.init(string: (trimPath?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))!){
            return url
        }else{
            return URL.init(string: "wwww")!
        }
    }
    
    
    /// 计算文本高度
    ///
    /// - Parameters:
    ///   - width: 文本宽度
    ///   - font: 文本字体
    ///   - lineSpacing: 文本间距
    /// - Returns: 文本的高度
    func mj_calculateHeigh(withWidth width:CGFloat,font:UIFont,lineSpacing:CGFloat) -> CGFloat{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing //行间距
        
        let attribute = [NSAttributedStringKey.font:font,NSAttributedStringKey.paragraphStyle:style]

        let value = NSString.init(string: self)
        
        let textSize = value.boundingRect(with: CGSize(width: width, height:CGFloat(MAXFLOAT)), options:  [.truncatesLastVisibleLine, .usesLineFragmentOrigin, .usesFontLeading], attributes: attribute, context: nil).size
        
        return textSize.height
        
    }
    
    /// 计算文本宽度
    ///
    /// - Parameters:
    ///   - height: 限制字符串显示区域的高度
    ///   - font: Lab的Font
    /// - Returns: 返回字符串高度
    func mj_calculateWidth(withHeight height:CGFloat,font:UIFont) -> CGFloat{
        
        let attribute = [NSAttributedStringKey.font:font]
        let value = NSString.init(string: self)
        let rect = value.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options:  [.truncatesLastVisibleLine, .usesLineFragmentOrigin, .usesFontLeading] , attributes: attribute, context: nil)
        return rect.size.width
    }
    
    /// 字符串时间 转date
    ///   "2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
    ///
    /// - Parameter format: "yyyy-MM-dd HH:mm:ss"
    /// - Returns: 1545975181
    func mj_date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    
    
}
