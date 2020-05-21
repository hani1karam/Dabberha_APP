//
//  BaseViewController.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.//
import Foundation
import UIKit
import SwiftMessages
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable {
    
    //MARK: Alerts
    func showAlertWiring(title: String, body: String = "") {
        
        let msgView = MessageView.viewFromNib(layout: .messageView)
        
        msgView.configureContent(title: title, body: body)
        msgView.configureTheme(.warning)
        msgView.button?.isHidden = true
        msgView.configureDropShadow()
        msgView.titleLabel?.textAlignment = .center
        msgView.bodyLabel?.textAlignment = .center
        
        msgView.titleLabel?.adjustsFontSizeToFitWidth = true
        msgView.bodyLabel?.adjustsFontSizeToFitWidth = true
        
        var config = SwiftMessages.defaultConfig
        
        config.presentationStyle = .center
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = SwiftMessages.Duration.seconds(seconds: 2)
        
        SwiftMessages.show(config: config, view: msgView)
    }
    
    func showAlertError(title: String, body: String = "") {
        
        let msgView = MessageView.viewFromNib(layout: .messageView)
        
        msgView.configureContent(title: title, body: body)
        msgView.configureTheme(.error)
        msgView.button?.isHidden = true
        msgView.configureDropShadow()
        msgView.titleLabel?.textAlignment = .center
        msgView.bodyLabel?.textAlignment = .center
        
        msgView.titleLabel?.adjustsFontSizeToFitWidth = true
        msgView.bodyLabel?.adjustsFontSizeToFitWidth = true
        
        var config = SwiftMessages.defaultConfig
        
        config.presentationStyle = .center
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = SwiftMessages.Duration.seconds(seconds: 2)
        
        SwiftMessages.show(config: config, view: msgView)
    }
    
    func showAlertsuccess(title: String, body: String = "") {
        
        let msgView = MessageView.viewFromNib(layout: .messageView)
        
        msgView.configureContent(title: title, body: body)
        msgView.configureTheme(.success)
        msgView.button?.isHidden = true
        msgView.configureDropShadow()
        msgView.titleLabel?.textAlignment = .center
        msgView.bodyLabel?.textAlignment = .center
        
        msgView.titleLabel?.adjustsFontSizeToFitWidth = true
        msgView.bodyLabel?.adjustsFontSizeToFitWidth = true
        
        var config = SwiftMessages.defaultConfig
        
        config.presentationStyle = .center
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = SwiftMessages.Duration.seconds(seconds: 1.5)
        
        SwiftMessages.show(config: config, view: msgView)
    }
    
    let backView = UIView()
    let loadingView = UIView()
    
    func showLoadingIndicator() {
        backView.backgroundColor = UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 0.4)
        self.view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        backView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        loadingView.backgroundColor = .white
        loadingView.addCornerRadius(10)
        self.view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 8).isActive = true
        loadingView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        loadingView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "انتظر قليلا من فضلك", messageFont: UIFont(name: "Tajawal", size: 15), type: .ballClipRotate, color: UIColor.green, backgroundColor: .clear, textColor: UIColor.darkGray, fadeInAnimation: nil)
     }
    
    func hideLoadingIndicator() {
        
        print("Upload")
        backView.removeFromSuperview()
        loadingView.removeFromSuperview()
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
}

