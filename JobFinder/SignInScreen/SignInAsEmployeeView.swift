//
//  SignInAsEmployeeView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInAsEmployeeView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Поиск работы")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .lineSpacing(20)
                Spacer()
            }
            TextFieldWithPlaceholderView(
                height: 40,
                placeholderView: EmailTextFieldPlaceholderView()
            )
            HStack(spacing: 24) {
                BlueButton(
                    title: "Продолжить",
                    fontSize: 14,
                    fontWeight: .regular,
                    height: 40
                )
//                Button {
//                    //buttonAction
//                } label: {
//                    Text("Войти с паролем")
//                }
//                .frame(height: 18)
//                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
            
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    SignInAsEmployeeView()
}
