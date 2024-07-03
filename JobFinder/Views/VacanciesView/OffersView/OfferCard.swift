//
//  QuickFilterCard.swift
//  JobFinder
//
//  Created by Николай Щербаков on 25.04.2024.
//

import SwiftUI

struct OfferCard: View {
    
    enum IconType {
        case pointer
        case star
        case note
    }
    
    var iconType: IconType?
    var text: String
    var buttonTitle: String?
    var buttonAction: (()-> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if iconType != nil {
                switch iconType {
                case .pointer: CardIconView(color: Color.darkBlue, image: Image(AssetsTitles.PointerIcon.rawValue))
                case .star: CardIconView(color: Color.darkGreen, image: Image(AssetsTitles.StarIcon.rawValue))
                case .note: CardIconView(color: Color.darkGreen, image: Image(AssetsTitles.NoteIcon.rawValue))
                case nil: EmptyView()
                }
            }
           
            HStack {
                Text(text)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.top, 8)
                Spacer()
            }
            
            if buttonTitle != nil {
                Button {
                    buttonAction!()
                } label: {
                    Text(buttonTitle!)
                        .font(.system(size: 14))
                }
                .tint(
                    assignButtonColor()
                )
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
        .frame(width: 132, height: 120, alignment: .leading)
        .background(Color.secondaryBackgroundColor)
        .clipShape(.rect(cornerRadius: 8))
    }
    
    private func assignButtonColor() -> Color {
        switch iconType {
            case .pointer: Color.blueButtonColor
            case .star: Color.greenButtonColor
            case .note: Color.greenButtonColor
            case nil: Color.blueButtonColor
        }
    }
}

#Preview {
    OfferCard(
        iconType: .pointer, text: "Поднять резюме в поиске"
    )
}
