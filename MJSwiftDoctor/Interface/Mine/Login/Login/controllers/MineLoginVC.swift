//
//  PocketPay1VC.swift
//  XLCustomer
//
//  Created by longma on 2019/1/9.
//  Copyright © 2019年 XLH. All rights reserved.
//

import UIKit

class MineLoginVC: MJBasicViewController {
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var viewTopTitle: UIView!
    @IBOutlet weak var btnWeiXin: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    //left
    
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var viewPhoneBg: UIView!
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var btnCode: UIButton!
    //right
    
    @IBOutlet weak var tfPassaword: UITextField!
    @IBOutlet weak var tfRightPhone: UITextField!
    @IBOutlet weak var viewRightPhoneBg: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIAppearance()
        
    }

    @objc func textValueChanged(){
        if viewRightPhoneBg.isHidden{
            if !tfPhone.isEmpty && !tfCode.isEmpty{
                btnLogin.setGradientLayer(colors: [UIColor.rgb(86,209,246).cgColor,UIColor.rgb(22,175,220).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                btnLogin.isEnabled = true
            }else{
                btnLogin.setGradientLayer(colors: [UIColor.rgb(229,234,236).cgColor,UIColor.rgb(214,222,224).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                btnLogin.isEnabled = false
            }
            

        }else{
            if !tfPassaword.isEmpty && !tfRightPhone.isEmpty{
                btnLogin.setGradientLayer(colors: [UIColor.rgb(86,209,246).cgColor,UIColor.rgb(22,175,220).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                btnLogin.isEnabled = true

            }else{
                btnLogin.setGradientLayer(colors: [UIColor.rgb(229,234,236).cgColor,UIColor.rgb(214,222,224).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
                btnLogin.isEnabled = false
            }
        }

        
    }
    @objc func actionCodeClick(){
        btnCode.mj_countDown(count: 10, enabledColor: UIColor.MJTheme.gray)
    }
    func setUIAppearance(){
        navigationController?.setNavigationBarHidden(true, animated: true)

        btnLogin.setGradientLayer(colors: [UIColor.rgb(229,234,236).cgColor,UIColor.rgb(214,222,224).cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        btnLogin.isEnabled = false
        //
        btnCode.addTarget(self, action: #selector(self.actionCodeClick), for: .touchUpInside)
        btnCode.setTitleColor(UIColor.MJTheme.main, for: .normal)
      
        
        viewRightPhoneBg.isHidden = true
        tfRightPhone.setSpace(leftSpace: 10)
        tfPassaword.setSpace(leftSpace: 10)
        tfRightPhone.clearButtonMode = .whileEditing
        tfPassaword.clearButtonMode = .whileEditing
        tfPassaword.setBorder(color: UIColor.MJTheme.border, width: 1)
        tfPassaword.setCornerRadius(5)
        tfPassaword.backgroundColor = UIColor.white
        tfRightPhone.backgroundColor = UIColor.white
        tfRightPhone.setBorder(color: UIColor.MJTheme.border, width: 1)
        tfRightPhone.setCornerRadius(5)
        tfRightPhone.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfPassaword.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfPassaword.isSecureTextEntry = true
        tfPassaword.returnKeyType = .done; //设置按键类型
        tfPassaword.delegate = self

        let btnPass = UIButton.init(type: .custom)
        btnPass.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        btnPass.setImage(UIImage.init(named: "密码关闭状态"), for: .normal)
        btnPass.setImage(UIImage.init(named: "密码查看状态"), for: .selected)
        btnPass.addAction { [weak self] (btn)  in
            
            btn?.isSelected = !(btn?.isSelected)!
            self?.tfPassaword.isSecureTextEntry = !(btn?.isSelected)!
        }
        tfPassaword.rightView = btnPass
        tfPassaword.rightViewMode = .always
        //
        
        tfPhone.setSpace(leftSpace: 10)
        tfCode.setSpace(leftSpace: 10)
        tfPhone.clearButtonMode = .whileEditing
        tfCode.clearButtonMode = .whileEditing
        tfPhone.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)
        tfCode.addTarget(self, action: #selector(self.textValueChanged), for: .editingChanged)

        //
        viewPhoneBg.setBorder(color: UIColor.MJTheme.border, width: 1)
        viewPhoneBg.backgroundColor = UIColor.white
        viewPhoneBg.setCornerRadius(5)

        tfCode.setBorder(color: UIColor.MJTheme.border, width: 1)
        tfCode.backgroundColor = UIColor.white
        tfCode.setCornerRadius(5)

        btnLogin.setCornerRadius(5)
        btnLogin .setTitleColor(UIColor.white, for: .normal)

        btnWeiXin.set(image: UIImage(named: "微信登录"), title: "微信一键登录", titlePosition: .right,
                      additionalSpacing: 10.0, state: .normal)
        btnWeiXin.setBorder(color: UIColor.MJTheme.border, width: 1)
        btnWeiXin.setTitleColor(UIColor.MJTheme.black, for: .normal)
        btnWeiXin.setCornerRadius(5)
        
        viewTopTitle.addSubview(pageTitleView)

        if let userName = MJUserManager.getUserDefault(key: kUserName) as? String{
            tfRightPhone.text = userName
        }
        
    }
    lazy var pageTitleView: SGPageTitleView = {
        
        let view = SGPageTitleView.init(frame: CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH - 60, height: 50), delegate: self, titleNames: ["手机快捷登录","账号密码登录"], configure: MJStyleManager.configPageView())!
        view.backgroundColor = UIColor.white
        
        return view
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//
       
        
    }
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        self.view.endEditing(false)
        
        print("点击登录")
        if viewRightPhoneBg.isHidden{
            
        }else{
            
            if tfRightPhone.isEmpty || tfPassaword.isEmpty {
                MJProgressHUD.showToat(withStatus: "用户名或密码不能为空")
                return
            }
            
            let currentDate = Date()
            
            MJData.shared.currentDate = currentDate
            
            
            let url = APIURL(APILogin)
            let passwordStr = "\(tfPassaword.text!)\(kServerTag)".md5()
            let UserName = "P|U|\(tfRightPhone.text!)"
            let userNameStr = "\("iOS"),\(currentDate.mj_timestampStr),\(UserName),\(passwordStr)"
            let encodedValue = userNameStr.mj_aes128.mj_stringConvertToUrlEncode()
            
            let parm:[String : Any] = ["user": encodedValue, "password": passwordStr]
            MJProgressHUD.show()
            MJAFNetWorking.post(urlString: url, parameters: parm ) { (response, error) in
                
                if let responseDic = response as? [String:Any] {
                    
                    MJProgressHUD.showSuccess(withStatus: responseDic["message"] as? String)

                    if let datas = responseDic["datas"] as? [String:Any] {
                        
                        if let list = datas["list"] as? [[String:Any]] {
                            
                            let userDic = list[0]
                            
                            let userModel = UserModel.setModel(with: userDic)
                            
                            MJUserManager.shared.saveUser(user: userModel)
                            
                            MJUserManager.setUserDefault(value: self.tfRightPhone.text!, key: kUserName)
                            
                            
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                    
                    if let tokenDic = responseDic["token"] as? [String:Any] {
                        
                        let tokenModel = TokenModel.setModel(with: tokenDic)
                        
                        MJUserManager.shared.saveToken(token: tokenModel)
                    }
                    
                }
                
                print("00000---------------\(response)")
            }
        }

    }
    
    @IBAction func actionWeiXin(_ sender: Any) {
    }
    
}

extension MineLoginVC: SGPageTitleViewDelegate {
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        if selectedIndex == 0{
            viewRightPhoneBg.isHidden = true
            viewPhoneBg.isHidden = false
        }else{
            viewRightPhoneBg.isHidden = false
            viewPhoneBg.isHidden = true
        }
        self.textValueChanged()
    }
}
extension MineLoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.actionLogin(btnLogin)
        
        return true
    }
}
