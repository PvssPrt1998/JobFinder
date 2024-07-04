//
//  ViewModelFactory.swift
//  JobFinder
//
//  Created by Николай Щербаков on 26.06.2024.
//

import Foundation
import Combine

final class ViewModelFactory {
    
    let authenticationController = AuthenticationController()
    var vacanciesController = VacanciesController()
    
    var vacanciesViewModel: VacanciesViewModel?
    var favoriteViewModel: FavoriteViewModel?
    
    private var authenticationControllerSubscribe: AnyCancellable?
    
    init() {
        vacanciesViewModel = VacanciesViewModel(vacanciesController: vacanciesController)
        favoriteViewModel = FavoriteViewModel(vacanciesController: vacanciesController)
        authenticationControllerSubscribe = authenticationController.$authenticated.sink { [weak self] authenticated in
            guard let self = self else { return }
            if authenticated {
                vacanciesController.loadData()
            }
        }
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
