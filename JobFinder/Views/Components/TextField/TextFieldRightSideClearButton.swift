//
//  TextFieldRightSideClearButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct TextFieldRightSideClearButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 13, height: 13)
                .padding(7.5)
                .foregroundStyle(Color.textFieldElementsColor)
        }
    }
}

#Preview {
    TextFieldRightSideClearButton {
        
    }
}
