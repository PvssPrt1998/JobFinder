//
//  RecomendationsView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct OffersView: View {
    
    var viewModel: OffersViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.offers, id: \.self) { offer in
                    OfferCard(iconType: assignIconType(by: offer.title), text: offer.title, buttonTitle: offer.button?.text)
                }
            }
            .frame(height: 120)
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.never)
    }
    
    private func assignIconType(by text: String) -> OfferCard.IconType? {
        switch text {
        case "Вакансии рядом с вами": .pointer
        case "Поднять резюме в поиске": .star
        case "Временная работа или подработка": .note
        default: nil
        }
    }
}

#Preview {
    OffersView(viewModel: OffersViewModel(vacanciesController: VacanciesController()))
}
