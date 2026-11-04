//
//  NetworkError.swift
//  Production_Networking_Architecture
//
//  Created by Anar Nabiyev on 04.11.26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case transport(URLError)
    case invalidResponse
    case http(statusCode: Int)
    case decoding(Error)
    case unauthorized
    case offline
    case timeout
}
