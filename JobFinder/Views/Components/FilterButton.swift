//
//  FilterButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct FilterButton: View {
    var body: some View {
        Image("FilterIcon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 16, height: 16)
            .padding(12)
            .background(Color.textFieldColor)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    FilterButton()
}
