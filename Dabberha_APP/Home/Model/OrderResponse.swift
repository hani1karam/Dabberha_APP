//
//  OrderResponse.swift
//  Dabberha_APP
//
//  Created by Hany Karam on 5/20/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//


import Foundation

// MARK: - OrderResponse
struct OrderResponse: Codable {
    let status: Int
    let subMessage: String
    let orderResponseReturn: [Return]
    let message: String

    enum CodingKeys: String, CodingKey {
        case status
        case subMessage = "sub_message"
        case orderResponseReturn = "return"
        case message
    }
}

// MARK: - Return
struct Return: Codable {
    let orderID, orderUser, orderPrice, userLocation: String
    let resturantName: String
    let orderDetails: [OrderDetail]

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case orderUser = "order_user"
        case orderPrice = "order_price"
        case userLocation = "user_location"
        case resturantName = "resturant_name"
        case orderDetails = "order_details"
    }
}

// MARK: - OrderDetail
struct OrderDetail: Codable {
    let prodName: String
    let prodQuantity: Int
    let prodPrice: String
    let prodImage: String

    enum CodingKeys: String, CodingKey {
        case prodName = "prod_name"
        case prodQuantity = "prod_quantity"
        case prodPrice = "prod_price"
        case prodImage = "prod_image"
    }
}
