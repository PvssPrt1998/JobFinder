//
//  PlaceholderView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct PlaceholderView: View {
    
    let image: Image
    let text: String
    
    var body: some View {
        HStack {
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 19.2)
            Text(text)
                .font(.system(size: 14))
                .lineLimit(1)
                .foregroundStyle(.gray)
            Spacer()
        }
    }
}

#Preview {
    PlaceholderView(image: Image("ResponsesIcon"), text: "Электронная почта или телефон")
}
