//
//  ITEMMODEL.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/20/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation

// MARK: - Item
struct Item: Codable {
    let status: Bool?
    let error: String?
    let data: [ItemDatum]
}

// MARK: - Datum
struct ItemDatum: Codable {
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
