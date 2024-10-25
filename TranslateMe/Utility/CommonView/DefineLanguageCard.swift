//
//  DefineLanguageCard.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 24.10.2024.
//

import SwiftUI

struct DefineLanguageCard: View {
    var action: (() -> Void)
    var body: some View {
        Button {action()} label: {
            Text("Define Language")
                .foregroundStyle(.white)
                .font(.roboto(.bold, size: 18))
                .frame(maxWidth: .infinity)
                .frame(height: 47)
        }
        .background(.hex003366)
        .clipShape(Capsule())
    }
}

#Preview {
    DefineLanguageCard(action: {})
}
