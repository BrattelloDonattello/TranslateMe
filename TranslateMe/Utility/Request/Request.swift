//
//  Request.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 22.10.2024.
//

import Foundation

final class Request {
    static let shared = Request()
    
    private init() {}
    
    func translateText(translateFrom: String, translateTo: String, _ textForTranslate: String) async throws -> String {
        guard let url = URL(string: Constant.shared.baseURL) else {
            throw ErrorHandler.invalidURL
        }
        
        let headers = [
            "Authorization": "Bearer \(Constant.shared.ApiKey)",
            "Content-Type": "application/json"
        ]
        
        let requestBody: [String: Any] = [
            "model": Constant.shared.requestModel,
            "messages": [
                ["role": "user", "content": "Translate from \(translateFrom) to \(translateTo): \(textForTranslate)"]
            ],
            "max_tokens": 100
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error invalidResponse: \(response)")
            throw ErrorHandler.invalidResponse
        }
        
        guard let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let choices = jsonResponse["choices"] as? [[String: Any]],
              let message = choices.first?["message"] as? [String: Any],
              let translatedText = message["content"] as? String else {
            throw ErrorHandler.noData
        }
        
        return translatedText
    }
    
    func translateTextWithDefineLanguage(translateTo: String, _ textForTranslate: String) async throws -> String {
        guard let url = URL(string: Constant.shared.baseURL) else {
            throw ErrorHandler.invalidURL
        }
        
        let headers = [
            "Authorization": "Bearer \(Constant.shared.ApiKey)",
            "Content-Type": "application/json"
        ]
        
        let requestBody: [String: Any] = [
            "model": Constant.shared.requestModel,
            "messages": [
                ["role": "user", "content": "Translate to \(translateTo): \(textForTranslate)"]
            ],
            "max_tokens": 100
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error invalidResponse: \(response)")
            throw ErrorHandler.invalidResponse
        }
        
        guard let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let choices = jsonResponse["choices"] as? [[String: Any]],
              let message = choices.first?["message"] as? [String: Any],
              let translatedText = message["content"] as? String else {
            throw ErrorHandler.noData
        }
        
        return translatedText
    }
}
