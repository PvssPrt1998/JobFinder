//
//  VacancyView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI

struct VacancyView: View {
    
    @ObservedObject var viewModel: VacancyViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ScreenTitle(text: viewModel.vacancy.title)
                Text(viewModel.vacancy.salary.full)
                    .font(.system(size: 14))
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.vacancy.experience.text)
                        .font(.system(size: 14))
                    Text(viewModel.schedulesLine())
                        .font(.system(size: 14))
                }.padding(.bottom, 12)
                if viewModel.isSomeoneApplied() || viewModel.isSomeoneLooking() {
                    HStack(spacing: 8) {
                        if viewModel.isSomeoneApplied() {
                            GreenLookingNumberCard(text: viewModel.appliedNumberLine()!, imageTitle: AssetsTitles.WhiteProfileIcon.rawValue).layoutPriority(1)
                        }
                        if viewModel.isSomeoneLooking() {
                            GreenLookingNumberCard(text: viewModel.lookingNumberLine()!, imageTitle: AssetsTitles.EyeIcon.rawValue).layoutPriority(1)
                        }
                        if !viewModel.isSomeoneApplied() || !viewModel.isSomeoneLooking() {
                            Spacer().layoutPriority(1)
                        }
                    }.padding(.bottom, 2)
                }
                AddressView(company: viewModel.vacancy.company, address: viewModel.address())
                if viewModel.vacancy.description != nil {
                    Text(viewModel.vacancy.description!)
                        .font(.system(size: 14))
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ваши задачи")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Text(viewModel.vacancy.responsibilities)
                        .font(.system(size: 14))
                }.padding(.bottom, 12)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Задайте вопрос работодателю")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                    Text("Он получит его с откликом на вакансию")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(viewModel.vacancy.questions, id: \.self) { question in
                        QuestionView(text: question)
                    }
                }.padding(.bottom, 4)
                
                GreenButton(title: "Откликнуться", fontSize: 16, height: 48, cornerRadius: 8, fontWeight: .semibold)
            }
            .padding(.horizontal, 16)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment: .center, spacing: 16) {
                    EyeButton()
                    ShareButton()
                    FavoriteButton(action: viewModel.favoriteToggle,
                                   isFavorite: viewModel.vacancy.isFavorite)
                }
            }
        }
    }
}

#Preview {
    VacancyView(viewModel: VacancyViewModel(vacanciesController: VacanciesController(), vacancyId: "cbf0c984-7c6c-4ada-82da-e29dc698bb50"))
}
