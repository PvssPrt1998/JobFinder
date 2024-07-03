//
//  ScreenTitle.swift
//  JobFinder
//
//  Created by Николай Щербаков on 01.07.2024.
//

import SwiftUI

struct ScreenTitle: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#Preview {
    ScreenTitle(text: "Вход в личный кабинет")
}
