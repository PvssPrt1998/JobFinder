//
//  FilterScrollIcon.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI

struct FilterScrollIcon: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Spacer()
            Image(systemName: "chevron.up")
                .resizable()
                .foregroundStyle(Color.blue)
                .frame(width: 7, height: 3)
                
            Image(systemName: "chevron.down")
                .resizable()
                .foregroundStyle(Color.blue)
                .frame(width: 7, height: 3)
            Spacer()
        }
        .frame(width: 16, height: 16)
    }
}

#Preview {
    FilterScrollIcon()
}
