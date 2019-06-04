//
//
//  0930-01-Swift3.0网络请求业务类
//
//  Created by on 16/9/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit
import AFNetworking

typealias AFHTTPRequestCompletionHandler = (_ response:Any,_ error:NSError?) -> Void

class MJAFNetWorking: AFHTTPSessionManager {
    

    //MARK: ************** 初始化
    static let initAFHttpManager : MJAFNetWorking = {
        
        let manager = MJAFNetWorking()
         
        manager.responseSerializer = AFJSONResponseSerializer()
        //申明返回的结果是json类型
        manager.requestSerializer = AFHTTPRequestSerializer()
        //申明请求的数据是HTTP类型
        manager.responseSerializer.acceptableContentTypes = Set<AnyHashable>(["application/json", "text/json", "text/javascript", "text/html"]) as? Set<String>
        manager.requestSerializer.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        //内容类型
        return manager
    }()
    class func setGlobleHttpHeaders(){

        let currentDate = MJData.shared.currentDate
        let dateStr = MJManager.getGMTFormatter(currentDate!)
        let uuid = MJManager.getUUID()
        let nonceStr =  "\(uuid)\(currentDate!.mj_timestampStr)".mj_aes128
        let signatureStr:String = "date: \(dateStr)".mj_hmacsha1(algorithm: .SHA1, key: kAppSecret)
        let authorizationStr =  "hmac id=\"\(kAppID)\", algorithm=\"hmac-sha1\", headers=\"date\", signature=\"\(signatureStr)\""
        
        let manager = MJAFNetWorking.initAFHttpManager
        manager.requestSerializer.setValue(dateStr, forHTTPHeaderField: "Date")
        manager.requestSerializer.setValue("iOS", forHTTPHeaderField: "Source")
        manager.requestSerializer.setValue(authorizationStr, forHTTPHeaderField: "Authorization")
        manager.requestSerializer.setValue(nonceStr, forHTTPHeaderField: "Nonce")
        
        print("00000----时间-----------\(authorizationStr)")

//        print("token = \("xxx"), appsecret = \(self.clientSecretEncrypt()), timestamp = \(Date.init().timestamp())")
    }

    /**
     发送put请求
     
     @param urlString 请求的网址字符串
     @param parameters 请求的参数
     @param completionBlock 请求回调
     */
    class func post(urlString:String,
                    parameters:[String : Any]?,
                    modelClass:AnyClass = MJAnyModel.self,
                    completion: @escaping AFHTTPRequestCompletionHandler){
        let manager = MJAFNetWorking.initAFHttpManager
        
        self.setGlobleHttpHeaders()
        
        let param = self.setBearer(parameters)
        
        manager.post(urlString, parameters: param, progress: { (poggress) in
            
        }, success: { (task, responseObject) in
            MJProgressHUD.dismiss()
            if let response = responseObject{
                self.showHandleSuccess(responseObject: response, modelClass:modelClass, completion: completion)
            }
        }) { (task, error) in
            
            MJProgressHUD.dismiss()

            self.handleError(error: error as NSError)
        }
        
    }
    class func showHandleSuccess(responseObject:Any,
                                 modelClass:AnyClass = MJAnyModel.self,
                                 completion: @escaping AFHTTPRequestCompletionHandler){
        
        if let responseDic = responseObject as? [String:Any] {
            
            if let code = responseDic["code"] as? Int{
                
                if code < 0 {
                    MJProgressHUD.showToat(withStatus: responseDic["message"] as? String)
                    print("=================   \(responseDic["message"] ?? "") ====code===\(code)")

                } else {
                    
                    if modelClass != MJAnyModel.self {
                        
                        if let responseDic = responseObject as? [String:Any] {
                            
                            if let datas = responseDic["datas"] as? [String:Any] {
                                
                                if let list = datas["list"] as? [[String:Any]] {
                                    
                                    let modelArray = NSArray.yy_modelArray(with: modelClass.self, json: list)
                                    completion(modelArray!, nil)
                                    
                                }
                            }
                        }
                    }else{
                        completion(responseObject, nil)

                    }
                    
                }
            }
        }
        

    }
    class func setBearer(_ parameters: [String : Any]?) -> [String : Any]? {
        
        var dicStr = ""
        
        if parameters != nil {
            dicStr = parameters!.mj_dictionaryConvertToString()
        }
        
        var param = ["Content": dicStr]
        if MJUserManager.shared.isLogin {
            let bearerStr = "Bearer \(MJUserManager.shared.tokenModel!.access_token!)"
            param["Bearer"] = bearerStr
        }
       
        return param
        
    }
    class func handleError(error:NSError) ->Void
    {
        
        if error.code == -1009
        {
            MJProgressHUD.showToat(withStatus: "数据获取失败\n请检查网络连接是否正常")
        }
        else if error.code == -1001
        {
            MJProgressHUD.showToat(withStatus: "请求超时")
        }
        else
        {
            if let response = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] as? HTTPURLResponse
            {
                print("error = \(response)")
                let statusCode = response.statusCode
                print("statusCode = \(statusCode)")
                
                if let data = error.userInfo["com.alamofire.serialization.response.error.data"] as? Data {
                   
                    let dictionary = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                    if let message = dictionary!["message"] {
                        MJProgressHUD.showError(withStatus: message as? String)
                    }
                }
                else
                {
                    MJProgressHUD.showError(withStatus: "请求出错!")
                }
                    
               
            }
        }
       
     }

   
}
