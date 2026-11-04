//
//  APIClient.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

protocol APIClientProtocol {
    
    func send<Response: Decodable>(_ endpoint: Endpoint, as type: Response.Type) async throws -> Response
}

final class APIClient: APIClientProtocol {
    
    private let session: URLSession
    private let requestBuilder: RequestBuilder
    private let decoder: JSONDecoder
    
    init(session: URLSession, requestBuilder: RequestBuilder, decoder: JSONDecoder = .init()) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.decoder = decoder
    }
    
    func send<Response>(_ endpoint: any Endpoint, as type: Response.Type) async throws -> Response where Response: Decodable {
        
        let request = try requestBuilder.makeRequest(from: endpoint)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.http(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode(Response.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
