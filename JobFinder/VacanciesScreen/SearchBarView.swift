//
//  SearchBarView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var text = ""
    
    var body: some View {
        HStack(spacing: 8) {
            TextFieldWithPlaceholderView(
                text: $text,
                height: 40,
                placeholderView: SearchTextFieldPlaceholderView()
            )
            FilterButton()
        }
    }
}

#Preview {
    SearchBarView()
}
