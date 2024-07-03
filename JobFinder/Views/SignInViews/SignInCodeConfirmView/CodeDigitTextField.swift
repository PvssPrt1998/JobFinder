//
//  CodeDigitTextField.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.04.2024.
//

import SwiftUI
import Combine

struct CodeDigitTextField: View {
    
    var digit: Binding<String>
    var focused: FocusState<SignInCodeConfirmView.Field?>.Binding
    var field: SignInCodeConfirmView.Field?
    
    var body: some View {
        TextField("", text: digit)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(digit), perform: { newValue in
                let filtered = newValue.wrappedValue.filter { Set("0123456789").contains($0) }
                if filtered != newValue.wrappedValue {
                    self.digit.wrappedValue = filtered
                } else {
                    if newValue.wrappedValue != "" {
                        self.focuseNextField()
                    }
                }
            })
            .focused(focused, equals: field)
            .frame(width: 20, height: 20)
            .padding(14)
            .background(Color.secondaryBackgroundColor)
            .clipShape(.rect(cornerRadius: 8))
    }
    
    private func focuseNextField() {
        switch focused.wrappedValue {
            case .first: focused.wrappedValue = .second
            case .second: focused.wrappedValue = .third
            case .third: focused.wrappedValue = .fourth
            case .fourth: focused.wrappedValue = .none
            case .none: break
        }
    }
}

struct CodeDigitTextField_Preview: PreviewProvider {
    
    @State static var digit = ""
    @FocusState static var focused: SignInCodeConfirmView.Field?
    
    static var previews: some View {
        CodeDigitTextField(digit: $digit, focused: $focused)
    }
    
}
