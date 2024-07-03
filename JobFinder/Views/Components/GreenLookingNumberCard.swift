//
//  GreenLookingNumberCard.swift
//  JobFinder
//
//  Created by Николай Щербаков on 02.07.2024.
//

import SwiftUI

struct GreenLookingNumberCard: View {
    
    var text: String
    var imageTitle: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 14))
            Spacer()
            VStack {
                CardIconView(color: Color.green, image: Image(imageTitle), multipler: 1)
                Spacer()
            }
        }
        .padding(8)
        .frame(height: 50)
        .background(Color.darkGreen)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    GreenLookingNumberCard(text: "140 человек уже откликнулось", imageTitle: AssetsTitles.EyeIcon.rawValue)
}
