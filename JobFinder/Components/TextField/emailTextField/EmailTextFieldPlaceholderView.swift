//
//  SignInTextFieldPlaceholderView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 24.04.2024.
//

import SwiftUI

struct EmailTextFieldPlaceholderView: View {
    var body: some View {
        PlaceholderView(
            image: Image("ResponsesIcon"),
            text: "Электронная почта или телефон"
        )
    }
}

#Preview {
    EmailTextFieldPlaceholderView()
}
