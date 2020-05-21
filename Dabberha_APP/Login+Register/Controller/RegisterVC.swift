//
//  RegisterVC.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class RegisterVC: BaseViewController {
    static func instance () -> RegisterVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
    }
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var Signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - Raduis Name Text Field
        NameTextField.layer.cornerRadius = 15.0
        NameTextField.layer.borderWidth = 2.0
        NameTextField.clipsToBounds = true
        NameTextField.layer.borderColor = UIColor.white.cgColor
        
        // MARK: - Raduis Email Text Field
        EmailTextField.layer.cornerRadius = 15.0
        EmailTextField.layer.borderWidth = 2.0
        EmailTextField.clipsToBounds = true
        EmailTextField.layer.borderColor = UIColor.white.cgColor
        
        
        
        // MARK: - Raduis password Text Field
        PasswordTextField.layer.cornerRadius = 15.0
        PasswordTextField.layer.borderWidth = 2.0
        PasswordTextField.clipsToBounds = true
        PasswordTextField.layer.borderColor = UIColor.white.cgColor
        
        // MARK: - Raduis Confirm password Text Field
        ConfirmPasswordTextField.layer.cornerRadius = 15.0
        ConfirmPasswordTextField.layer.borderWidth = 2.0
        ConfirmPasswordTextField.clipsToBounds = true
        ConfirmPasswordTextField.layer.borderColor = UIColor.white.cgColor
        
        // MARK: - Raduis phone Text Field
        PhoneTextField.layer.cornerRadius = 15.0
        PhoneTextField.layer.borderWidth = 2.0
        PhoneTextField.clipsToBounds = true
        PhoneTextField.layer.borderColor = UIColor.white.cgColor
        
        
        // MARK: - Raduis SIGN UP
        Signup.layer.borderColor = #colorLiteral(red: 0.7384514213, green: 0.5312874913, blue: 0.07105452567, alpha: 1)
        Signup.layer.cornerRadius = 5
        Signup.layer.cornerRadius = 30
        Signup.layer.borderWidth = 6
        
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        if validData(){
            let parm = [
                "email": EmailTextField.text ?? "",
                "password": PasswordTextField.text ?? "" ,
                "name":NameTextField.text ?? "" ,
                "confirm_password":ConfirmPasswordTextField.text ?? "",
                "phone":PhoneTextField.text ?? "",
                "address":"cairo"
            ]
            
            self.showLoadingIndicator()
            NetworkManagerUser.RegisterUser(userInfoDict: parm) { [unowned self] (user, error) in
                self.hideLoadingIndicator()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.status else{return}
                        if status == true {
                            self.showAlertsuccess(title: "تم تسجيل حساب جديد")
                            let Home = HomeVC.instance()
                            Home.modalPresentationStyle = .fullScreen
                            self.present(Home, animated: true, completion: nil)
                            self.finish()
                        }else{
                            self.showAlertWiring(title: "خطأ في التسجيل اعد كتابة رقم الهاتف او كلمة المرور")
                        }
                    }
                }else{
                    self.showAlertWiring(title: "خطأ في التسجيل اعد كتابة رقم الهاتف او كلمة المرور")
                }
            }
        }
        
    }
    func validData() -> Bool{
        
        if EmailTextField.text!.isEmpty && PasswordTextField.text!.isEmpty && NameTextField.text!.isEmpty && ConfirmPasswordTextField.text!.isEmpty && PhoneTextField.text!.isEmpty {
            self.showAlertWiring(title: "please enter your data")
            return false
        }
        
        if EmailTextField.text!.isEmpty{
            self.showAlertWiring(title: "Enter your email")
            return false
        }
        if NameTextField.text!.isEmpty{
            self.showAlertWiring(title: "Enter your name")
            return false
        }
        
        if PasswordTextField.text!.isEmpty{
            self.showAlertWiring(title: "please enter password")
            return false
        }
        if PasswordTextField.text != ConfirmPasswordTextField.text {
            self.showAlertWiring(title: "password and confirm not match")
            return false
        }
        if PhoneTextField.text!.isEmpty {
            self.showAlertWiring(title: "please enter phone")
            return false
            
        }
        
        return true
    }
    
    func finish(){
        self.EmailTextField.text = ""
        self.PasswordTextField.text = ""
        self.NameTextField.text = ""
        self.ConfirmPasswordTextField.text = ""
        self.PhoneTextField.text = ""
        
    }
    
    
    
    
}
