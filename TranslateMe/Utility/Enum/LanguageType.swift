//
//  LanguageType.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import Foundation
import SwiftUI

enum LanguageType: String, CaseIterable {
    case english = "English"
    case spanish = "Spanish"
    case czech = "Czech"
    case france = "France"
    case germany = "Germany"
    case romania = "Romanian"
    case russia = "Russia"
    case turkey = "Turkish"
    case ukraine = "Ukraine"
    
    var flag: ImageResource {
        switch self {
        case .english:
            return .english
        case .spanish:
            return .spanish
        case .czech:
            return .czech
        case .france:
            return .france
        case .germany:
            return .germany
        case .romania:
            return .romania
        case .russia:
            return .russia
        case .turkey:
            return .turkey
        case .ukraine:
            return .ukraine
        }
    }
    
    var languageCode: String {
        switch self {
        case .english:
            return "en"
        case .spanish:
            return "es"
        case .czech:
            return "cs"
        case .france:
            return "fr-FR"
        case .germany:
            return "de-DE"
        case .romania:
            return "ro"
        case .russia:
            return "ru"
        case .turkey:
            return "tr"
        case .ukraine:
            return "uk"
        }
    }
    
    var emptyText: String {
        switch self {
        case .english:
            return "Enter text here..."
        case .spanish:
            return "Introduzca texto aquí..."
        case .czech:
            return "Sem zadejte text..."
        case .france:
            return "Entrez du texte ici..."
        case .germany:
            return "Hier Text eingeben..."
        case .romania:
            return "Introduceți text aici..."
        case .russia:
            return "Введите текст здесь..."
        case .turkey:
            return "Buraya metin girin..."
        case .ukraine:
            return "Введіть текст тут..."
        }
    }
}
