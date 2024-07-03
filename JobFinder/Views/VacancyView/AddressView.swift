//
//  AddressView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 02.07.2024.
//

import SwiftUI

struct AddressView: View {
    
    var company: String
    var address: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(company)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                Image(AssetsTitles.CheckIcon.rawValue)
                    .resizable()
                    .frame(width: 12, height: 12)
            }
            Image(AssetsTitles.Map.rawValue)
                .resizable()
                .frame(height: 58)
            Text(address)
                .font(.system(size: 14))
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    AddressView(company: "Компания", address: "Адрес")
}
