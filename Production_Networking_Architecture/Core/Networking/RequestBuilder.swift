//
//  RequestBuilder.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

struct RequestBuilder {
    
    let baseURL: URL
    
    func makeRequest(from endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        
        components?.path = endpoint.path
        components?.queryItems = endpoint.queryItems.isEmpty ? nil : endpoint.queryItems
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        
        endpoint.headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
