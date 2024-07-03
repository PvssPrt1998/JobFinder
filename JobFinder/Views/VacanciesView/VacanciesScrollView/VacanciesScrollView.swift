//
//  VacanciesScrollView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI

struct VacanciesScrollView: View {
    
    @ObservedObject var viewModel: VacanciesScrollViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.vacancies, id: \.self) { vacancy in
                        VacancyCardView(vacancy: vacancy) {
                            viewModel.favoriteToggle(vacancyId: vacancy.id)
                        } cardTapAction: {
                            viewModel.cardTapAction(vacancy: vacancy)
                        }
                    }
                }.padding(.horizontal, 16)
            }
            if !viewModel.detailedMode {
                BlueButton(action: viewModel.buttonAction,
                           title: viewModel.hiddenVacanciesLine(),
                           fontSize: 16,
                           fontWeight: .semibold,
                           height: 48,
                           disabled: false)
            }
        }
    }
}

#Preview {
    VacanciesScrollView(viewModel: VacanciesScrollViewModel(vacanciesController: VacanciesController()))
}
