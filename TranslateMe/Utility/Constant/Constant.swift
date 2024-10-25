//
//  Constant.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 22.10.2024.
//

import Foundation

final class Constant {
    static var shared = Constant()
    
    private init() {}
    
    let baseURL = "https://api.openai.com/v1/chat/completions"
    
    let ApiKey = ""
    
    let requestModel = "gpt-4o-mini"
}
