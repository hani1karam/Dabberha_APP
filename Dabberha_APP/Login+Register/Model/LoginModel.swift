//
//  LoginModel.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

 import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let status: Bool?
    let error: String?
    let data: LoginModelDataClass
}

// MARK: - LoginModelDataClass
struct LoginModelDataClass: Codable {
    let id: Int?
    let name, email, phone, address: String?
    let active: Int?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, address, active
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
