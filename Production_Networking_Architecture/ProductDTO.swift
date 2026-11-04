//
//  ProductDTO.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

//DTO
struct ProductDTO: Decodable {
    
    let id: Int
    let productName: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case price
    }
}

extension ProductDTO {
    
    func toDomain() -> Product {
        Product(id: id, name: productName, price: Decimal(price))
    }
}

struct Product: Identifiable {
    let id: Int
    let name: String
    let price: Decimal
}

struct ProductResponseDTO: Decodable {
    let products: [ProductDTO]
}
