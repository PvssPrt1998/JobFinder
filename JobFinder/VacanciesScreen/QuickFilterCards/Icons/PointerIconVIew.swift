//
//  PointerIconVIew.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct PointerIconVIew: View {
    var body: some View {
        QuickFilterCardIconView(
            color: Color.darkBlue,
            image: Image(AssetsTitles.PointerIcon.rawValue)
        )
    }
}

#Preview {
    PointerIconVIew()
}
