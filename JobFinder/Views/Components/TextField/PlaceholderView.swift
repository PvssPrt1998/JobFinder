//
//  PlaceholderView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 21.04.2024.
//

import SwiftUI

struct PlaceholderView: View {
    
    var imageTitle: String?
    let text: String
    
    var body: some View {
        HStack {
            if imageTitle != nil {
                Image(imageTitle!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 19.2)
            }
            Text(text)
                .font(.system(size: 14))
                .lineLimit(1)
                .foregroundStyle(.gray)
            Spacer()
        }
    }
}

#Preview {
    PlaceholderView(imageTitle: ImageTitles.responseIcon.rawValue,
                    text: "Электронная почта или телефон")
}
