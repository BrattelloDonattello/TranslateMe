//
//  SelectTranslatedLanguageCard.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 24.10.2024.
//

import SwiftUI

struct SelectTranslatedLanguageCard: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var showOverlayLanguage: Bool
    var positionOfCheckmark: SelectLanguageCheckMark
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(LanguageType.allCases, id: \.self) { item in
                HStack {
                    Text(item.rawValue)
                        .foregroundStyle(.black)
                        .font(.roboto(.medium, size: 16))
                    
                    Spacer()
                    
                    if positionOfCheckmark == .right {
                        if viewModel.leftLanguage.rawValue == item.rawValue {
                            Image(systemName: "checkmark")
                        }
                    } else {
                        if viewModel.rightLanguage.rawValue == item.rawValue {
                            Image(systemName: "checkmark")
                        }
                    }
                }
                .frame(width: 120)
                .onTapGesture {
                    withAnimation(.spring) {
                        if positionOfCheckmark == .right {
                            viewModel.leftLanguage = item
                        } else {
                            viewModel.rightLanguage = item
                        }
                        showOverlayLanguage.toggle()
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10, y: 4)
        .offset(x: offsetX, y: offsetY)
        .zIndex(2)
        .opacity(1.0)
    }
}
