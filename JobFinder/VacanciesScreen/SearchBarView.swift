//
//  SearchBarView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 8) {
            TextFieldWithPlaceholderView(
                height: 40,
                placeholderView: SearchTextFieldPlaceholderView()
            )
            FilterButton()
        }
    }
}

#Preview {
    SearchBarView()
}
