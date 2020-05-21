//
//  NetworkManagetUser.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import Alamofire
class NetworkManagerUser{
    class func LoginUser (userInfoDict : [String:Any] , completion : @escaping( LoginModel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"]
        Alamofire.request(login, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(LoginModel.self, from: response.data!)
                    print(responseModel)
                    completion(responseModel , nil)
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(nil , error)
                }
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil , error)
            }
        }
    } // login function
    
    class func RegisterUser (userInfoDict : [String:Any] , completion : @escaping( RegisterModel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"]
        Alamofire.request(register, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(RegisterModel.self, from: response.data!)
                    print(responseModel)
                    completion(responseModel , nil)
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(nil , error)
                }
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil , error)
            }
        }
    } // Register Function
    
}
