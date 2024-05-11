//
//  TestView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 10.05.2024.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(spacing: 22) {
            SignInAsEmployeeView()
            SignInAsEmployerView()
        }
    }
}

#Preview {
    TestView()
}
