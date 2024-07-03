//
//  SignInView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInView: View {
    
    var viewModel: SignInViewModel
    @FocusState var focused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.001)   // <--- important
                    .layoutPriority(-1)
                    .onTapGesture {
                        focused = false
                    }
                VStack() {
                    Spacer().frame(height: UITabBarController().height)
                    ScreenTitle(text: "Вход в личный кабинет")
                    Spacer()
                }
                VStack(spacing: 22) {
                    SignInAsEmployeeView(viewModel: viewModel.signInAsEmployeeViewModel, focused: $focused)
                    SignInAsEmployerView()
                }
            }
            .padding(.horizontal, 16)
            .onTapGesture {
                focused = false
            }
        }
        
    }
}

struct SignInView_Preview: PreviewProvider {
    @FocusState static var focused: Bool
    
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(authenticationController: AuthenticationController()))
    }
}
