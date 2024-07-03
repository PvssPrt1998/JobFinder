//
//  VacanciesController.swift
//  JobFinder
//
//  Created by Николай Щербаков on 30.06.2024.
//

import Foundation

final class VacanciesController: ObservableObject {
    
    @Published var vacancies: Array<Vacancy> = []
    @Published var offers: Array<Offer> = []
    
    let dataManager: DataManager
    
    init() {
        self.dataManager = DataManager()
        let storedVacancies = try? dataManager.localStorage.fetchVacancies()
        if storedVacancies != nil {
            vacancies = storedVacancies!
        }
        guard let model = dataManager.fetchData() else { fatalError("Cannot fetch data from mock JSON") }
        offers = model.offers
        model.vacancies.forEach { vacancy in
            if !vacancies.contains(where: { $0.id == vacancy.id }) {
                if vacancy.isFavorite {
                    dataManager.localStorage.addVacancy(vacancy: vacancy)
                }
                vacancies.append(vacancy)
            }
        }
    }
    
    func vacancyFavoriteToggle(vacancyId: String) {
        if let index = vacancies.firstIndex(where: {$0.id == vacancyId}) {
            vacancies[index].isFavorite.toggle()
            if vacancies[index].isFavorite {
                dataManager.localStorage.addVacancy(vacancy: vacancies[index])
            } else {
                dataManager.localStorage.removeVacancy(vacancyId: vacancies[index].id)
            }
        }
    }
    
    func vacanciesCountLine(_ count: Int) -> String {
        var string = "\(count) "
        switch count % 10 {
            case 1: count == 11 ? (string += "вакансий") : (string += "вакансия")
            case 2...4: string += "вакансии"
            default: string += "вакансий"
        }
        return string
    }
    
    func favoriteVacanciesCount() -> Int {
        vacancies.reduce(0) { $1.isFavorite ?  $0 + 1 : $0 + 0 }
    }
    
    func peepsNumberLine(_ number: Int) -> String {
        "\(number) человек" + lookingNumberLine(number)
    }
    
    private func lookingNumberLine(_ number: Int) -> String {
        switch number % 10 {
        case 2...4: return "a "
            default: return " "
        }
    }
}
