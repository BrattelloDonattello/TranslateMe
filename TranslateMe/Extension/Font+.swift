//
//  Font+.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import Foundation
import SwiftUI

extension Font {
    enum RobotoFont {
        case black, bold, italic, light, medium, regular, thin
        
        var value: String {
            switch self {
            case .black:
                return "Roboto-Black"
            case .bold:
                return "Roboto-Bold"
            case .italic:
                return "Roboto-Italic"
            case .light:
                return "Roboto-Light"
            case .medium:
                return "Roboto-Medium"
            case .regular:
                return "Roboto-Regular"
            case .thin:
                return "Roboto-Thin"
            }
        }
    }
    
    static func roboto(_ type: RobotoFont, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
}
