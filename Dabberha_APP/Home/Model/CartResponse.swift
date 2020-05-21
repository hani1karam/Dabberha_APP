//
//  CartResponse.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
 
// MARK: - CartResponse
struct CartResponse: Codable {
    let status: Bool?
    let error, data: String?
}
