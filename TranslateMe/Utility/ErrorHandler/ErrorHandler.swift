//
//  ErrorHandler.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 22.10.2024.
//

import Foundation

enum ErrorHandler: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError
    case serverError(statusCode: Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response from the server."
        case .noData:
            return "No data received from the server."
        case .decodingError:
            return "Failed to decode data."
        case .serverError(let statusCode):
            return "Server returned an error with status code: \(statusCode)."
        }
    }
}
