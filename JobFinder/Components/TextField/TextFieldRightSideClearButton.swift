//
//  TextFieldRightSideClearButton.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct TextFieldRightSideClearButton: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Button {
               text = ""
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
}

struct TextFieldRightSideClearButton_Preview: PreviewProvider {
    
    @State static var text = ""
    
    static var previews: some View {
        TextFieldRightSideClearButton(text: $text)
    }
}
