//
//  AllProduct.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/19/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation

// MARK: - AllProduct
struct AllProduct: Codable {
    let status: Bool?
    let error: String?
    let data: [AllProductDatum]
}

// MARK: - AllProductDatum
struct AllProductDatum: Codable {
    let id: Int?
    let title, datumDescription: String?
    let more: String?
    let price: String?
    let discount, quantity, rate: Int?
    let isFavorite: Bool?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case more, price, discount, quantity, rate, isFavorite, images
    }
}
