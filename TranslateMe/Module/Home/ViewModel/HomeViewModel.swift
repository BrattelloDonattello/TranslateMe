//
//  HomeViewModel.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import Foundation
import UIKit

class HomeViewModel: ObservableObject {
    @Published var leftLanguage: LanguageType = .english
    @Published var rightLanguage: LanguageType = .russia
    
    func copySupportLink(_ textToCopy: String) {
        UIPasteboard.general.string = textToCopy
    }
    
    func swapLanguage() {
        let saveRightLanguage = rightLanguage
        
        rightLanguage = leftLanguage
        leftLanguage = saveRightLanguage
    }
}
