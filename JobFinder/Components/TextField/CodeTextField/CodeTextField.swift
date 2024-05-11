//
//  CodeTextField.swift
//  JobFinder
//
//  Created by Николай Щербаков on 23.04.2024.
//

import SwiftUI

struct CodeTextField: View {
    var body: some View {
        HStack(spacing: 8) {
            CodeDigitTextField()
            CodeDigitTextField()
            CodeDigitTextField()
            CodeDigitTextField()
            Spacer()
        }
    }
}

#Preview {
    CodeTextField()
}
