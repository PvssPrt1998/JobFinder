//
//  LocalStorage.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import Foundation

final class LocalStorage {
    
    enum LocalStorageError: Error {
        case cannotGetVacancyEntitiesFromLocalStorage
        case cannotRemoveVacancy
    }
    
    private let modelName = "Vacancy"
    
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    func fetchVacancies() throws -> [Vacancy] {
        var vacancies: Array<Vacancy> = []
        let vacanciesCoreData = try coreDataStack.managedContext.fetch(VacancyCoreData.fetchRequest())
        vacanciesCoreData.forEach { vacancyCoreData in
            vacancies.append(createVacancy(with: vacancyCoreData))
        }
        return vacancies
    }
    
    func addVacancy(vacancy: Vacancy) {
        let vacancyCoreData = VacancyCoreData(context: coreDataStack.managedContext)
        vacancyCoreData.id = vacancy.id
        vacancyCoreData.company = vacancy.company
        vacancy.appliedNumber != nil ? vacancyCoreData.appliedNumber = Int32(vacancy.appliedNumber!) : ()
        vacancy.lookingNumber != nil ? vacancyCoreData.lookingNumber = Int32(vacancy.lookingNumber!) : ()
        vacancyCoreData.isFavorite = vacancy.isFavorite
        vacancyCoreData.publishedDate = vacancy.publishedDate
        vacancyCoreData.questions = vacancy.questions as [NSString]
        vacancyCoreData.responsibilities = vacancy.responsibilities
        vacancyCoreData.schedules = vacancy.schedules as [NSString]
        vacancyCoreData.title = vacancy.title
        vacancy.description != nil ? vacancyCoreData.vacancyDescription = vacancy.description! : ()
        let experienceCoreData = ExperienceCoreData(context: coreDataStack.managedContext)
        experienceCoreData.previewText = vacancy.experience.previewText
        experienceCoreData.text = vacancy.experience.text
        experienceCoreData.vacancy = vacancyCoreData
        let salaryCoreData = SalaryCoreData(context: coreDataStack.managedContext)
        salaryCoreData.full = vacancy.salary.full
        salaryCoreData.short = vacancy.salary.short
        salaryCoreData.vacancy = vacancyCoreData
        let addressCoreData = AddressCoreData(context: coreDataStack.managedContext)
        addressCoreData.house = vacancy.address.house
        addressCoreData.town = vacancy.address.town
        addressCoreData.street = vacancy.address.street
        addressCoreData.vacancy = vacancyCoreData
        
        coreDataStack.saveContext()
    }
    
    func removeVacancy(vacancyId: String) {
        guard let vacancies = try? coreDataStack.managedContext.fetch(VacancyCoreData.fetchRequest()) else { return }
        let vacancyForRemove = vacancies.first(where: { $0.id == vacancyId} )
        guard let vacancyForRemove = vacancyForRemove else { return }
        coreDataStack.managedContext.delete(vacancyForRemove)
        coreDataStack.saveContext()
    }
    
    private func createVacancy(with vacancyCoreData: VacancyCoreData) -> Vacancy {
        let address = Address(town: vacancyCoreData.address.town,
                              street: vacancyCoreData.address.street,
                              house: vacancyCoreData.address.house)
        let experience = Experience(previewText: vacancyCoreData.experience.previewText,
                                    text: vacancyCoreData.experience.text)
        let salary = Salary(full: vacancyCoreData.salary.full,
                            short: vacancyCoreData.salary.short)
        let lookingNumber: Int? = vacancyCoreData.lookingNumber > 0 ? Int(vacancyCoreData.lookingNumber) : nil
        let appliedNumber: Int? = vacancyCoreData.appliedNumber > 0 ? Int(vacancyCoreData.appliedNumber) : nil
        let vacancy = Vacancy(id: vacancyCoreData.id,
                              lookingNumber: lookingNumber,
                              title: vacancyCoreData.title,
                              address: address,
                              company: vacancyCoreData.company,
                              experience: experience,
                              publishedDate: vacancyCoreData.publishedDate,
                              isFavorite: vacancyCoreData.isFavorite,
                              salary: salary,
                              schedules: vacancyCoreData.schedules as [String],
                              appliedNumber: appliedNumber,
                              description: vacancyCoreData.vacancyDescription,
                              responsibilities: vacancyCoreData.responsibilities,
                              questions: vacancyCoreData.questions as [String])
        return vacancy
    }
}
