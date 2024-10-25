//
//  SpeakerManager.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 24.10.2024.
//

import Foundation
import AVFoundation

class SpeakerManager {
    static let shared = SpeakerManager()
    
    init() {}
    
    func speakText(_ textToSpeak: String, speakLanguage: String) {
        let speaker = AVSpeechUtterance(string: textToSpeak)
        speaker.voice = AVSpeechSynthesisVoice(language: speakLanguage)
        speaker.rate = 0.3
        
        let syntezier = AVSpeechSynthesizer()
        syntezier.speak(speaker)
    }
}
