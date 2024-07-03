//
//  EyeButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import SwiftUI

struct EyeButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(AssetsTitles.EyeIcon.rawValue)
                .resizable()
                .scaledToFit()
        }
        .frame(width: 24, height: 24)
    }
}

#Preview {
    EyeButton()
}
