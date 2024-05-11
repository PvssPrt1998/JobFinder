//
//  SignInView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
//        NavigationStack {
//            VStack(spacing: 22) {
//                SignInAsEmployeeView()
//                SignInAsEmployerView()
//            }
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Text("Вход в личный кабинет")
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                }
//            }
//        }
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
                SignInAsEmployeeView()
                SignInAsEmployerView()
            }
        }
    }
}

#Preview {
    SignInView()
}
