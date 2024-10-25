//
//  HomeView.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 22.10.2024.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var enteredText = "" {
        didSet {
            if !enteredText.isEmpty {
                hideOverlay()
            }
        }
    }
    @State private var translatedText: String?
    @State private var showLeftLanguage = false
    @State private var showRightLanguage = false
    @State private var showErrorAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            LanguageCard(showLeftLanguage: $showLeftLanguage, showRightLanguage: $showRightLanguage, viewModel: viewModel)
            
            DefineLanguageCard {self.defineLanguageAndTranslate(textToTranslate: enteredText)}
            
            TranslateItemCard(enteredText: $enteredText, leftLanguage: $viewModel.leftLanguage) {
                hideOverlay()
                self.translateText(textTotranslate: enteredText)
            }
            
            if let text = translatedText {
                TranslatedCard(languageType: viewModel.rightLanguage, translatedText: text)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onTapGesture {
            hideOverlay()
        }
        .overlay(alignment: .topLeading) {
            if showLeftLanguage {
                SelectTranslatedLanguageCard(viewModel: viewModel, showOverlayLanguage: $showLeftLanguage, positionOfCheckmark: .right, offsetX: 25, offsetY: 10)
                    .zIndex(2)
                
            }
        }
        .overlay(alignment: .topTrailing) {
            if showRightLanguage {
                SelectTranslatedLanguageCard(viewModel: viewModel, showOverlayLanguage: $showRightLanguage, positionOfCheckmark: .left, offsetX: -25, offsetY: 10)
                    .zIndex(2)
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Oops... Something went wrong, try again!"))
        }
    }
    
    func translateText(textTotranslate: String) {
        Task {
            do {
                translatedText = try await Request.shared.translateText(translateFrom: viewModel.leftLanguage.rawValue, translateTo: viewModel.rightLanguage.rawValue, textTotranslate)
            } catch {
                showErrorAlert.toggle()
            }
        }
    }
    
    func defineLanguageAndTranslate(textToTranslate: String) {
        Task {
            do {
                translatedText = try await Request.shared.translateTextWithDefineLanguage(translateTo: viewModel.rightLanguage.rawValue, textToTranslate)
            } catch {
                showErrorAlert.toggle()
            }
        }
    }
    
    private func hideOverlay() {
        self.showLeftLanguage = false
        self.showRightLanguage = false
    }
}

#Preview {
    HomeView()
}
