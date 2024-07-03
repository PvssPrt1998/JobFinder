//
//  ViewModelFactory.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation

final class ViewModelFactory {
    
    let authenticationController = AuthenticationController()
    let vacanciesController = VacanciesController()
    
    var vacanciesViewModel: VacanciesViewModel?
    var favoriteViewModel: FavoriteViewModel?
    
    init() {
        self.vacanciesViewModel = VacanciesViewModel(vacanciesController: vacanciesController)
        self.favoriteViewModel = FavoriteViewModel(vacanciesController: vacanciesController)
    }
    
    func makeContentViewModel() -> ContentViewModel {
        ContentViewModel(authenticationController: authenticationController)
    }
    
    func makeTabBarViewModel() -> TabBarViewModel {
        TabBarViewModel(authenticationController: authenticationController)
    }
    
    func makeSignInViewModel() -> SignInViewModel {
        SignInViewModel(authenticationController: authenticationController)
    }
    
    func makeSignInCodeConfirmViewModel() -> SignInCodeConfirmViewModel {
        SignInCodeConfirmViewModel(authenticationController: authenticationController)
    }
    
    func makeVacanciesViewModel() -> VacanciesViewModel {
        vacanciesViewModel!
    }
    
    func makeVacancyViewModel(vacancyId: String) -> VacancyViewModel {
        VacancyViewModel(vacanciesController: vacanciesController, vacancyId: vacancyId)
    }
    
    func makeFavoriteViewModel() -> FavoriteViewModel {
        favoriteViewModel!
    }
}
