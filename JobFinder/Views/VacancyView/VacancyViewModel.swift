//
//  VacancyViewModel.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import Foundation

final class VacancyViewModel: ObservableObject {
    
    var vacanciesController: VacanciesController
    @Published var vacancy: Vacancy!
    
    init(vacanciesController: VacanciesController, vacancyId: String) {
        self.vacanciesController = vacanciesController
        self.vacancy = vacanciesController.vacancies.first(where: {$0.id == vacancyId})
    }
    
    func schedulesLine() -> String {
        vacancy.schedules.joined(separator: ", ").firstUppercased
    }
    
    func isSomeoneApplied() -> Bool {
        vacancy.appliedNumber == nil ? false : true
    }
    
    func isSomeoneLooking() -> Bool {
        vacancy.lookingNumber == nil ? false : true
    }
    
    func appliedNumberLine() -> String? {
        guard let number = vacancy.appliedNumber else { return nil }
        return vacanciesController.peepsNumberLine(number)
        + (number % 10 == 1 ? "уже откликнулся" : "уже откликнулись")
    }
    
    func lookingNumberLine() -> String? {
        guard let number = vacancy.lookingNumber else { return nil }
        return vacanciesController.peepsNumberLine(number)
        + (number % 10 == 1 ? "сейчас смотрит" : "сейчас смотрят")
    }
    
    func address() -> String {
        vacancy.address.town + ", " + vacancy.address.street + ", " + vacancy.address.house
    }
    
    func favoriteToggle() {
        vacancy.isFavorite.toggle()
        vacanciesController.vacancyFavoriteToggle(vacancyId: vacancy.id)
    }
}
