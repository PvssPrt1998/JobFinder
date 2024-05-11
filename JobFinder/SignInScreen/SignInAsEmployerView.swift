//
//  SignInAsEmployerView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct SignInAsEmployerView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("Поиск сотрудников")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("Размещение вакансий и доступ к базе резюме")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .lineLimit(1)
                    Spacer()
                }
            }
            GreenButton(title: "Я ищу сотрудников", fontSize: 14, height: 32)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    SignInAsEmployerView()
}
