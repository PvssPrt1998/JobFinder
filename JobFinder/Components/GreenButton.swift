//
//  GreenButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct GreenButton: View {
    var title: String
    var fontSize: CGFloat
    var height: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text(title)
                    .font(.system(size: fontSize))
                    .fontWeight(.regular)
                    .tint(.white)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
            Spacer()
        }
        .frame(height: height)
        .background(Color.greenButtonColor)
        .clipShape(.rect(cornerRadius: 50))
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    GreenButton(
        title: "Я ищу сотрудников",
        fontSize: 14,
        height: 40
    )
}
