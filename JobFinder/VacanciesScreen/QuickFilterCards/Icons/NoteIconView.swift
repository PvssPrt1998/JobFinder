//
//  NoteIconView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct NoteIconView: View {
    var body: some View {
        QuickFilterCardIconView(
            color: Color.darkGreen,
            image: Image(AssetsTitles.NoteIcon.rawValue)
        )
    }
}

#Preview {
    NoteIconView()
}
