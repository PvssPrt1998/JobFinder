//
//  FilterScrollView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI

struct FilterVacanciesView: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("По соответствию")
                .font(.system(size: 14))
                .foregroundStyle(Color.blue)
            FilterScrollIcon()
        }
    }
}

#Preview {
    FilterVacanciesView()
}
