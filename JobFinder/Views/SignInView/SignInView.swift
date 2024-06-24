//
//  SignInView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            VStack() {
                HStack {
                    Text("Вход в личный кабинет")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                }
                Spacer()
            }
            VStack(spacing: 22) {
                SignInAsEmployeeView(viewModel: viewModel.signInAsEmployeeViewModel)
                SignInAsEmployerView()
            }
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel(authenticationController: AuthenticationController()))
}
