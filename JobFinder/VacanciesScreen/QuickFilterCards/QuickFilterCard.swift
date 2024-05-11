//
//  QuickFilterCard.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct QuickFilterCard<T: View>: View {
    
    var icon: T
    var text: String
    
    var body: some View {
        VStack(spacing: 16){
            HStack {
                icon
                Spacer()
            }
            HStack {
                Text(text)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
        .frame(width: 132, height: 120)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    QuickFilterCard(
        icon: StarIconView(),
        text: "Поднять резюме в поиске"
    )
}
