//
//  LoadView.swift
//  JobFinder
//
//  Created by Николай Щербаков on 04.07.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var animationIsOn: Bool
    
    @State var firstHeight: CGFloat = 0
    @State var secondHeight: CGFloat = 0
    @State var thirdHeight: CGFloat = 0
    @State var fourthHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                ZStack {//скрытый элемент под первым столбиком чтобы сделать задержку анимации
                    Rectangle()
                        .frame(width: 20, height: fourthHeight)
                        .foregroundStyle(Color.clear)
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(width: 20, height: firstHeight)
                            .foregroundStyle(Color.secondaryBackgroundColor)
                        Rectangle()
                            .frame(width: 20, height: firstHeight)
                            .foregroundStyle(Color.clear)
                    }
                }
                
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 20, height: secondHeight)
                        .foregroundStyle(Color.secondaryBackgroundColor)
                    Rectangle()
                        .frame(width: 20, height: secondHeight)
                        .foregroundStyle(Color.clear)
                }
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 20, height: thirdHeight)
                        .foregroundStyle(Color.secondaryBackgroundColor)
                    Rectangle()
                        .frame(width: 20, height: thirdHeight)
                        .foregroundStyle(Color.clear)
                }
            }
            Spacer()
        }
        .onAppear() {
            firstAnimation()
        }
    }
    
    private func firstAnimation() {
        withAnimation(.linear(duration: 0.5)) {
            firstHeight = 40
        } completion: {
            secondAnimation()
        }
    }
    
    private func secondAnimation() {
        withAnimation(.linear(duration: 0.5)) {
            secondHeight = 40
        } completion: {
            thirdAnimation()
        }
    }
    
    private func thirdAnimation() {
        withAnimation(.linear(duration: 0.5)) {
            thirdHeight = 40
        } completion: {
            delayAnimation()
        }
    }
    
    private func delayAnimation() {
        withAnimation(.linear(duration: 0.05)) {
            fourthHeight = 40
        } completion: {
            if animationIsOn {
                firstHeight = 0
                secondHeight = 0
                thirdHeight = 0
                fourthHeight = 0
                firstAnimation()
            }
        }
    }
}

struct LoadingView_Preview: PreviewProvider {
    
   @State static var isOn = true
    
    static var previews: some View {
        LoadingView(animationIsOn: $isOn)
    }
}
