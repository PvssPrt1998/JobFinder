//
//  SignInTextField.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct TextFieldWithPlaceholderView: View {
    
    @State var text = ""
    
    var height: CGFloat
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                SignInTextFieldPlaceholderView()
            }
            TextField("", text: $text)
                .font(.system(size: 14))
                .lineSpacing(12)
                .frame(height: 28)
            if !text.isEmpty {
                HStack {
                    TextFieldRightSideClearButton(text: $text)
                }

            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .frame(height: height)
        .background(Color.textFieldColor)
        .clipShape(.rect(cornerRadius: 8))
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    TextFieldWithPlaceholderView(height: 40)
}
