//
//  SignInCodeConfirmView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.04.2024.
//

import SwiftUI

struct SignInCodeConfirmView: View {

    @ObservedObject var viewModel: SignInCodeConfirmViewModel
    
    enum Field: Hashable, CaseIterable {
        case first
        case second
        case third
        case fourth
    }
    
    @FocusState var focused: Field?
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Отправили код на \(viewModel.email)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
            }
            HStack {
                Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Spacer()
            }
            HStack(spacing: 8) {
                CodeDigitTextField(digit: $viewModel.first, focused: $focused, field: .first)
                CodeDigitTextField(digit: $viewModel.second, focused: $focused, field: .second)
                CodeDigitTextField(digit: $viewModel.third, focused: $focused, field: .third)
                CodeDigitTextField(digit: $viewModel.fourth, focused: $focused, field: .fourth)
                Spacer()
            }
            .onAppear(perform: focusFirstField)
            BlueButton(
                action: {
                    viewModel.buttonAction()
                },
                title: "Подтвердить",
                fontSize: 16,
                fontWeight: .semibold,
                height: 48,
                disabled: viewModel.buttonDisabled
            )
        }
        .padding(.horizontal, 14)
    }
    
    private func focusFirstField() {
        focused = Field.allCases.first
    }
    
    private func focuseNextField() {
        switch focused {
            case .first: focused = .second
            case .second: focused = .third
            case .third: focused = .fourth
            case .fourth: focused = .none
            case .none: break
        }
    }
}

#Preview {
    SignInCodeConfirmView(viewModel: SignInCodeConfirmViewModel(authenticationController: AuthenticationController()))
}
