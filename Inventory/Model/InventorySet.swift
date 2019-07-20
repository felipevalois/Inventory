//
//  InventorySet.swift
//  Inventory
//
//  Created by Felipe Costa on 7/18/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

struct InventorySet: Codable {
    var status: String
    var products: [ProductItem]

    func productCount() -> Int {
        return products.count
    }
    
    enum CodingKeys: String, CodingKey{
        case status
        case products
    }
}

struct ProductItem: Codable {
    var id: Int
    var category: String
    var title: String
    var price: Double
    var stockedQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case price
        case stockedQuantity
    }
}

