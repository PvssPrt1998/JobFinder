//
//  FavouriteView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel: FavoriteViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            ScreenTitle(text: "Избранное")
                .padding(.top, 64)
                .padding(.bottom, 16)
            HStack {
                Text(viewModel.favoriteVacanciesCountLine())
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                Spacer()
            }
            if viewModel.showLoadingView {
                LoadingView(animationIsOn: $viewModel.showLoadingView)
            } else {
                ScrollView {
                    VStack {
                        
                        ForEach(viewModel.vacancies, id: \.self) { vacancy in
                            VacancyCardView(vacancy: vacancy) {
                                viewModel.favoriteToggle(vacancyId: vacancy.id)
                            } cardTapAction: {
                                viewModel.cardTapAction(vacancyId: vacancy.id)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FavoriteView(viewModel: FavoriteViewModel(vacanciesController: VacanciesController()))
}
