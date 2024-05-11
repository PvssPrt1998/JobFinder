//
//  CodeDigitTextField.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.04.2024.
//

import SwiftUI

struct CodeDigitTextField: View {
    
    @State var digit: String = ""
    
    var body: some View {
        TextField("", text: $digit)
            .multilineTextAlignment(.center)
            .frame(width: 20, height: 20)
            .padding(28)
            .background(Color.secondaryBackgroundColor)
            .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    CodeDigitTextField()
}
