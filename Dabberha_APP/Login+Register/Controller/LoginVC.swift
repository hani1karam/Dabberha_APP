//
//  ViewController.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var RegisterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Raduis Email Text Field
        EmailTextField.layer.cornerRadius = 15.0
        EmailTextField.layer.borderWidth = 2.0
        EmailTextField.clipsToBounds = true
        EmailTextField.layer.borderColor = UIColor.white.cgColor
        
        // MARK: - Raduis password Text Field
        PassWordTextField.layer.cornerRadius = 15.0
        PassWordTextField.layer.borderWidth = 2.0
        PassWordTextField.clipsToBounds = true
        PassWordTextField.layer.borderColor = UIColor.white.cgColor
        
        
        // MARK: - Raduis Login
        LoginButton.layer.borderColor = #colorLiteral(red: 0.7384514213, green: 0.5312874913, blue: 0.07105452567, alpha: 1)
        LoginButton.layer.cornerRadius = 5
        LoginButton.layer.cornerRadius = 30
        LoginButton.layer.borderWidth = 6
        
        
        
        
    }
    // MARK: - Login Button
    
    @IBAction func LoginButton(_ sender: Any) {
        if validData(){
            let parm = [
                "email": EmailTextField.text ?? "",
                "password": PassWordTextField.text ?? ""]
            
            self.showLoadingIndicator()
            NetworkManagerUser.LoginUser(userInfoDict: parm) { [unowned self] (user, error) in
                self.hideLoadingIndicator()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.status else{return}
                        if status == true {
                            self.showAlertsuccess(title: "تم تسجيل الدخول بنجاح")
                         

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
        
        if EmailTextField.text!.isEmpty && PassWordTextField.text!.isEmpty{
            self.showAlertWiring(title: "please enter your data")
            return false
        }
        
        if EmailTextField.text!.isEmpty{
            self.showAlertWiring(title: "Enter your email")
            return false
        }
        
        if PassWordTextField.text!.isEmpty{
            self.showAlertWiring(title: "please enter password")
            return false
        }
        
        return true
    }
    
    func finish(){
        self.EmailTextField.text = ""
        self.PassWordTextField.text = ""
    }
    // MARK: - Go to Register Home
    
    @IBAction func RegisterHome(_ sender: Any) {
        let HomeVC = RegisterVC.instance()
        HomeVC.modalPresentationStyle = .fullScreen
        self.present(HomeVC, animated: true, completion: nil)
    }
    
    
}

