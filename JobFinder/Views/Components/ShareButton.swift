//
//  ShareButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(AssetsTitles.ShareIcon.rawValue)
                .resizable()
                .scaledToFit()
        }
        .frame(width: 24, height: 24)
    }
}

#Preview {
    ShareButton()
}
