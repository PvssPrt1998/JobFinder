//
//  SignInTextField.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct TextFieldWithPlaceholderView<V: View>: View {
    
    var text: Binding<String>
    @FocusState var fieldFocused: Bool
    
    var clearButtonAction: (() -> Void)?
    var borderColor: Color?
    var height: CGFloat
    var placeholderView: V
    
    var body: some View {
        ZStack {
            TextField("", text: text)
                .font(.system(size: 14))
                .focused($fieldFocused)
                .autocorrectionDisabled()
                .lineLimit(1)
                .frame(height: 28)
                .background(content: {
                    if !fieldFocused && text.wrappedValue == "" {
                        placeholderView
                    }
                })
            if !text.wrappedValue.isEmpty && clearButtonAction != nil {
                HStack {
                    Spacer()
                    TextFieldRightSideClearButton(action: clearButtonAction!)
                }
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .frame(height: height)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill( borderColor != nil ? borderColor! : Color.textFieldColor )
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 2)
                    .fill(Color.textFieldColor)
            })
        .clipShape(.rect(cornerRadius: 8))
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}

struct TextFieldWithPlaceholder_Preview: PreviewProvider {
    
    @State static var text = ""
    
    static var previews: some View {
        TextFieldWithPlaceholderView(text: $text, clearButtonAction: {},
                                     height: 40,
                                     placeholderView: EmailTextFieldPlaceholderView())
    }
    
}
