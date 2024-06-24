//
//  SignInAsEmployeeView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInAsEmployeeView: View {
    
    @ObservedObject var viewModel: SignInAsEmployeeViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Поиск работы")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .lineSpacing(20)
                Spacer()
            }
            VStack(spacing: 6) {
                TextFieldWithPlaceholderView(text: $viewModel.text,
                                             clearButtonAction: viewModel.clearButtonAction,
                                             errorMode: viewModel.errorMode,
                                             height: 40,
                                             placeholderView: EmailTextFieldPlaceholderView())
                if viewModel.errorMode {
                    HStack {
                        Text("Вы ввели неверный e-mail")
                            .font(.caption)
                            .foregroundStyle(.red)
                        Spacer()
                    }
                }
            }
            
            BlueButton(
                action: viewModel.buttonAction,
                title: "Продолжить",
                fontSize: 14,
                fontWeight: .regular,
                height: 40,
                disabled: viewModel.buttonDisabled
            )
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    SignInAsEmployeeView(viewModel: SignInAsEmployeeViewModel(authenticationController: AuthenticationController()))
}
