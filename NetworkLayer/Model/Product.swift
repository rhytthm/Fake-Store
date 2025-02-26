//
//  Product.swift
//  NetworkLayer
//
//  Created by RAJEEV MAHAJAN on 26/02/25.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias Products = [Product]
