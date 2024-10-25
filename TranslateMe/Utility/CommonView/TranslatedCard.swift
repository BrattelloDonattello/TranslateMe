//
//  TranslatedCard.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import SwiftUI

struct TranslatedCard: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    @State var speakerManager: SpeakerManager = SpeakerManager.shared
    var languageType: LanguageType
    var translatedText: String
    
    var body: some View {
        VStack(spacing: 0, content: {
            EnteredTextLanguage
            TranslatedText
            CopyButton
        })
        .padding(.horizontal, 20)
        .padding(.vertical, 17)
        .background(.hex6750A4.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10, y: 1)
    }
}

#Preview {
    TranslatedCard(languageType: .english, translatedText: "Hello")
        .padding()
}

extension TranslatedCard {
    private var EnteredTextLanguage: some View {
        HStack {
            Text(languageType.rawValue)
                .foregroundStyle(.hex003366)
                .font(.roboto(.medium, size: 16))
            
            Image(.speaker)
                .onTapGesture {
                    speakerManager.speakText(translatedText, speakLanguage: languageType.languageCode)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var TranslatedText: some View {
        Text(translatedText)
            .foregroundStyle(.black)
            .font(.roboto(.regular, size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.top)
            .animation(.spring)
    }
    private var CopyButton: some View {
        HStack {
            Spacer()
            
            Button {
                viewModel.copySupportLink(translatedText)
            } label: {
                Image(.copy)
            }
        }
    }
}
