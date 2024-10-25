//
//  FilledButtonStyle.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import Foundation
import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.roboto(.medium, size: 14))
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(.hexFF6600)
            .clipShape(Capsule())
    }
}
