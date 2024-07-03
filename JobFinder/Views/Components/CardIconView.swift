//
//  QuickFilterCardIconView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct CardIconView: View {
    
    var color: Color
    var image: Image
    var multipler: CGFloat = 2
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 8 * multipler)
            .padding(4 * multipler)
            .background(color)
            .clipShape(.circle)
    }
}

#Preview {
    CardIconView(color: Color.darkGreen, image: Image("StarIcon"))
}
