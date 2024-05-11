//
//  SignInView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                SignInAsEmployeeView()
                SignInAsEmployerView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Вход в личный кабинет")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
