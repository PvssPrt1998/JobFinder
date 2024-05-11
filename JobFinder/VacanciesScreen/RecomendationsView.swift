//
//  RecomendationsView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct RecomendationsView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                QuickFilterCard(
                    icon: PointerIconVIew(),
                    text: "Вакансии рядом с вами"
                )
                QuickFilterCard(
                    icon: StarIconView(),
                    text: "Поднять резюме в поиске"
                )
                QuickFilterCard(
                    icon: NoteIconView(),
                    text: "Временная работа и подработка"
                )
            }
            .frame(height: 120)
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    RecomendationsView()
}
