//
//  SearchTextFieldPlaceholderView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 24.04.2024.
//

import SwiftUI

struct SearchTextFieldPlaceholderView: View {
    var body: some View {
        PlaceholderView(
            image: Image("SearchIcon"),
            text: "Должность, ключевые слова"
        )
    }
}

#Preview {
    SearchTextFieldPlaceholderView()
}
