//
//  RegisterModel.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation

// MARK: - RegisterModel
struct RegisterModel: Codable {
    let status: Bool?
    let error: String?
    let data: RegisterModelDataClass
}

// MARK: - RegisterModelDataClass
struct RegisterModelDataClass: Codable {
    let email, name, phone, address: String?
    let updatedAt, createdAt: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case email, name, phone, address
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}

