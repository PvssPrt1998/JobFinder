//
//  StarIconView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct StarIconView: View {
    var body: some View {
        QuickFilterCardIconView(
            color: Color.darkGreen,
            image: Image(AssetsTitles.StarIcon.rawValue)
        )
    }
}

#Preview {
    StarIconView()
}
