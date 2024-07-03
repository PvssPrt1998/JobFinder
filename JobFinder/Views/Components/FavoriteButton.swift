//
//  HeathToolbarItem.swift
//  JobFinder
//
//  Created by Николай Щербаков on 03.07.2024.
//

import SwiftUI

struct FavoriteButton: View {
    
    var action: () -> Void
    var isFavorite: Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageTitle())
                .resizable()
                .scaledToFit()
        }
        .frame(width: 24, height: 24)
    }
    
    private func imageTitle() -> String {
        isFavorite ? AssetsTitles.HeartFilledIcon.rawValue : ImageTitles.heartIcon.rawValue
    }
}

#Preview {
    FavoriteButton(action: {}, isFavorite: true)
}
