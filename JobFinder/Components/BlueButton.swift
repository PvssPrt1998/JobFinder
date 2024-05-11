//
//  ButtonWithBlueBackground.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct BlueButton: View {
    
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
                    .tint(.white)
            }
            Spacer()
        }
        .frame(height: height)
        .background(Color.blueButtonColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    BlueButton(
        title: "Продолжить",
        fontSize: 14,
        height: 40
    )
}
