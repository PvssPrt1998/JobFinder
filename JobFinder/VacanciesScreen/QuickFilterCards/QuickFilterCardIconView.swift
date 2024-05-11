//
//  QuickFilterCardIconView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct QuickFilterCardIconView: View {
    
    var color: Color
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 16)
            .padding(8)
            .background(color)
            .clipShape(.circle)
    }
}

#Preview {
    QuickFilterCardIconView(color: Color.darkGreen, image: Image("StarIcon"))
}
