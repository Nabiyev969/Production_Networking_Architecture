//
//  ProductsRepository.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

protocol ProductsRepositoryProtocol {
    
    func products(page: Int) async throws -> [Product]
}

final class ProductsRepository: ProductsRepositoryProtocol {
    
    private let remote: ProductsServiceProtocol
    
    init(remote: ProductsServiceProtocol) {
        self.remote = remote
    }
    
    func products(page: Int) async throws -> [Product] {
        
        let response = try await remote.fetchProducts(page: page)
        return response.products.map { $0.toDomain() }
    }
}
