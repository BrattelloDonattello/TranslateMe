//
//  LanguageCard.swift
//  TranslateMe
//
//  Created by Ciupac Cristian  on 23.10.2024.
//

import SwiftUI

struct LanguageCard: View {
    @Binding var showLeftLanguage: Bool
    @Binding var showRightLanguage: Bool
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            leftLanguage
            
            Spacer()
            
            swapButton
            
            Spacer()
            
            rightLanguage
        }
        .padding(12)
        .background(.hex6750A4.opacity(0.15))
        .clipShape(Capsule())
        .shadow(radius: 10, y: 1)
    }
}

extension LanguageCard {
    private var leftLanguage: some View {
        HStack(spacing: 10, content: {
            Image(viewModel.leftLanguage.flag)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Text(viewModel.leftLanguage.rawValue)
                .foregroundStyle(.black)
                .font(.roboto(.medium, size: 16))
        })
        .frame(maxWidth: 120, alignment: .leading)
        .onTapGesture {
            showLeftLanguage.toggle()
        }
    }
    private var swapButton: some View {
        Button {
            withAnimation(.spring) {
                viewModel.swapLanguage()
            }
        } label: {
            Image(.swap)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
    }
    private var rightLanguage: some View {
        HStack(spacing: 10, content: {
            Text(viewModel.rightLanguage.rawValue)
                .foregroundStyle(.black)
                .font(.roboto(.medium, size: 16))
            Image(viewModel.rightLanguage.flag)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        })
        .frame(maxWidth: 120, alignment: .trailing)
        .onTapGesture {
            showRightLanguage.toggle()
        }
    }
}
