//
//  QuestionView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 02.07.2024.
//

import SwiftUI

struct QuestionView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.medium)
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
            .background(Color.secondaryBackgroundColor)
            .clipShape(.rect(cornerRadius: 50))
    }
}

#Preview {
    QuestionView(text: "Question")
}
