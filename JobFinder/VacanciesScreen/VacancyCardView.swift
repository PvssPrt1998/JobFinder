//
//  VacancyCardView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.04.2024.
//

import SwiftUI

struct VacancyCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Сейчас просматривает 1 человек")
                        .font(.system(size: 14))
                        .foregroundStyle(.green)
                    Text("UI/UI дизайнер")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Минск")
                        HStack(spacing: 8) {
                            Text("Мобирикс")
                            Image(AssetsTitles.CheckIcon.rawValue)
                        }
                    }
                    HStack(spacing: 8) {
                        Image(AssetsTitles.CaseIcon.rawValue)
                            .padding(2)
                        Text("Опыт от 1 года до 3 лет")
                    }
                    Text("Опубликовано 20 февраля")
                }
                Spacer()
                Image(AssetsTitles.HeartFilledIcon.rawValue)
            }
            GreenButton(title: "Откликнуться", fontSize: 14, height: 32)
        }
        .padding(16)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    VacancyCardView()
}
