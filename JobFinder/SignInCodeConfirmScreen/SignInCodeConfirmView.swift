//
//  SignInCodeConfirmView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.04.2024.
//

import SwiftUI

struct SignInCodeConfirmView: View {
    
    @State var digit: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Отправили код на example@mail.ru")
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
            CodeTextField()
            BlueButton(
                action: {},
                title: "Подтвердить",
                fontSize: 16,
                fontWeight: .semibold,
                height: 48
            )
        }
        .padding(.horizontal, 14)
    }
}

#Preview {
    SignInCodeConfirmView()
}
