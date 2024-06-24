//
//  ButtonWithBlueBackground.swift
//  JobFinder
//
//  Created by Николай Щербаков on 19.04.2024.
//

import SwiftUI

struct BlueButton: View {
    
    var action: () -> Void
    var title: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var height: CGFloat
    var disabled = true
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: fontSize))
                    .fontWeight(fontWeight)
                .tint(.white)
                Spacer()
            }
        }
        .frame(height: height)
        .background(
            disabled ? Color.darkBlue : Color.blueButtonColor)
        .clipShape(.rect(cornerRadius: 8))
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        .disabled(disabled)
    }
}

#Preview {
    BlueButton(
        action: {},
        title: "Продолжить",
        fontSize: 14,
        fontWeight: .regular,
        height: 40
    )
}
