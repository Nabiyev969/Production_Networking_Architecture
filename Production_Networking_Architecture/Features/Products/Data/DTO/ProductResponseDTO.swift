//
//  ProductResponseDTO.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

struct ProductResponseDTO: Decodable {
    let products: [ProductDTO]
}
