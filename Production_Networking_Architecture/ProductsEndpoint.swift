//
//  ProductsEndpoint.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

enum ProductsEndpoint: Endpoint {
    
    case list(page: Int)
    case details(id: Int)
    
    var path: String {
        
        switch self {
        case .list:
            "/products"
        case .details(let id):
            "/products/\(id)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [URLQueryItem] {
        
        switch self {
        case .list(let page):
            [
                URLQueryItem(name: "page", value: String(page))
            ]
        case .details:
            []
        }
    }
    
    var body: Data? {
        nil
    }
}
