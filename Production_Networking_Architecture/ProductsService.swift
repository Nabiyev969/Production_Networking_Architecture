//
//  ProductsService.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

protocol ProductsServiceProtocol {
    
    func fetchProducts(page: Int) async throws -> ProductResponseDTO
    
    func fetchProduct(id: Int) async throws -> ProductDTO
}

final class ProductsService: ProductsServiceProtocol {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchProducts(page: Int) async throws -> ProductResponseDTO {
        
        try await apiClient.send(ProductsEndpoint.list(page: page), as: ProductResponseDTO.self)
    }
    
    func fetchProduct(id: Int) async throws -> ProductDTO {
        
        try await apiClient.send(ProductsEndpoint.details(id: id), as: ProductDTO.self)
    }
}
