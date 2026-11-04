//
//  ProductsViewModel.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

@MainActor
@Observable
final class ProductsViewModel {
    
    enum State {
        case idle
        case loading
        case loaded([Product])
        case failed(String)
    }
    
    private let repository: ProductsRepositoryProtocol
    private(set) var state: State = .idle
    
    init(repository: ProductsRepositoryProtocol) {
        self.repository = repository
    }
    
    func load() async {
        state = .loading
        
        do {
            let products = try await repository.products(page: 1)
            state = .loaded(products)
        } catch is CancellationError {
            return
        } catch {
            state = .failed("Unable to load products.")
        }
    }
}
