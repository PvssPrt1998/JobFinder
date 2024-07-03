//
//  VacancyCardView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.04.2024.
//

import SwiftUI

struct VacancyCardView: View {

    var vacancy: Vacancy
    var favoriteButtonAction: () -> Void
    var cardTapAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    if vacancy.lookingNumber != nil {
                        Text("Сейчас просматривает \(vacancy.lookingNumber!) человек" + lookingNumberLine())
                            .font(.system(size: 14))
                            .foregroundStyle(.green)
                    }
                    
                    Text(vacancy.title)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(vacancy.address.town)
                        HStack(spacing: 8) {
                            Text(vacancy.company)
                            Image(AssetsTitles.CheckIcon.rawValue)
                        }
                    }
                    HStack(spacing: 8) {
                        Image(AssetsTitles.CaseIcon.rawValue)
                            .padding(2)
                        Text(vacancy.experience.previewText)
                    }
                    Text("Опубликовано " + dayByDate() + " " + monthByDate())
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Spacer()
                FavoriteButton(action: favoriteButtonAction, isFavorite: vacancy.isFavorite)
            }
            GreenButton(title: "Откликнуться", fontSize: 14, height: 32)
                .onTapGesture { }
        }
        .padding(16)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
        .onTapGesture {
            cardTapAction()
        }
    }
    
    private func dateByString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: vacancy.publishedDate)
    }
    
    private func dayByDate() -> String {
        guard let date = dateByString() else { return "incorrect date" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        var day = dateFormatter.string(from: date)
        if day.first == "0" { day.removeFirst() }
        return day
    }
    
    private func monthByDate() -> String {
        guard let date = dateByString() else { return "incorrect date" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: date)
        
        switch month {
        case "01": return "января"
        case "02": return "февраля"
        case "03": return "марта"
        case "04": return "апреля"
        case "05": return "мая"
        case "06": return "июня"
        case "07": return "июля"
        case "08": return "августа"
        case "09": return "сентября"
        case "10": return "октября"
        case "11": return "ноября"
        case "12": return "декабря"
        default: return "incorrectDate"
        }
    }
    
    private func lookingNumberLine() -> String {
        guard let number = vacancy.lookingNumber else { return "" }
        switch number % 10 {
        case 2...4: return "a"
            default: return ""
        }
    }
}
