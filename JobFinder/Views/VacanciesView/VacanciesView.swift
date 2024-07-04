//
//  SearchView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct VacanciesView: View {
    
    @ObservedObject var viewModel: VacanciesViewModel
    
    var body: some View {
        VStack {
            SearchBarView()
                .padding(16)
            Spacer().frame(height: 16)
            if !viewModel.detailedMode {
                if !viewModel.showLoadingView {
                    OffersView(viewModel: viewModel.recomendationsViewModel)
                        .padding(.vertical, 16)
                } else {
                    LoadingView(animationIsOn: $viewModel.showLoadingView)
                        .frame(height: 120)
                }
                
                HStack {
                    Text("Вакансии для вас")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                }.padding(.horizontal, 16)
            } else {
                HStack {
                    Text(viewModel.vacanciesCountLine())
                        .font(.system(size: 14))
                    Spacer()
                    FilterVacanciesView()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 6)
            }
            if viewModel.showLoadingView {
                LoadingView(animationIsOn: $viewModel.showLoadingView)
            } else {
                VacanciesScrollView(viewModel: viewModel.vacanciesScrollViewModel)
            }
        }
    }
}

#Preview {
    VacanciesView(viewModel: ViewModelFactory().makeVacanciesViewModel())
}
