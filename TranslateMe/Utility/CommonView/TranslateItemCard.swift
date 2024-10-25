//
//  TranslateItemCard.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import SwiftUI

struct TranslateItemCard: View {
    @Binding var enteredText: String
    @Binding var leftLanguage: LanguageType
    @State var speakerManager: SpeakerManager = SpeakerManager.shared
    var action: (() -> Void)
    
    var body: some View {
        VStack(spacing: 0, content: {
            enteredTextLanguage
            textEditorSection
            translateTextButton
        })
        .padding(.horizontal, 20)
        .padding(.vertical, 17)
        .background(.hex6750A4.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10, y: 1)
        .zIndex(1)
    }
}

extension TranslateItemCard {
    private var enteredTextLanguage: some View {
        HStack {
            Text(leftLanguage.rawValue)
                .foregroundStyle(.hex003366)
                .font(.roboto(.medium, size: 16))
                .padding(.leading, 5)
                .zIndex(1)
            
            Image(.speaker)
                .onTapGesture {
                    speakerManager.speakText(enteredText, speakLanguage: leftLanguage.languageCode)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var textEditorSection: some View {
        ZStack(alignment: .topLeading) {
            if enteredText.isEmpty {
                Text(leftLanguage.emptyText)
                    .foregroundStyle(.hexA7A7A7)
                    .font(.roboto(.regular, size: 14))
                    .offset(x: 5, y: 8)
                    .padding(.top)
            }
            TextEditor(text: $enteredText)
                .font(.roboto(.regular, size: 14))
                .scrollContentBackground(.hidden)
                .padding(.top)
                .background(.clear)
        }
        .frame(height: 150)
        .zIndex(1)
    }
    private var translateTextButton: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {
                Text("Translate")
            }
            .frame(maxWidth: 108)
            .buttonStyle(FilledButtonStyle())
        }
        .zIndex(1)
    }
}
