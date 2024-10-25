//
//  TranslateMeApp.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 22.10.2024.
//

import SwiftUI

@main
struct TranslateMeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .preferredColorScheme(.light)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
