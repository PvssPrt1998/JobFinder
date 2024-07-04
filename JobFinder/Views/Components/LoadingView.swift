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
    
//    var repeatingAnimation: Animation {
//        Animation
//            .linear(duration: 1)
//            .repeatForever(autoreverses: false)
//            .repeatForever()
//    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 20, height: firstHeight)
                        .foregroundStyle(Color.secondaryBackgroundColor)
                    Rectangle()
                        .frame(width: 20, height: firstHeight)
                        .foregroundStyle(Color.clear)
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
//            withAnimation(self.repeatingAnimation) {
//                self.firstHeight = 40
//
//            } completion: {
//                <#code#>
//            }
//            withAnimation(self.repeatingAnimation.delay(0.5)) {
//                self.secondHeight = 40
//            }
//            withAnimation(self.repeatingAnimation.delay(1)) {
//                self.thirdHeight = 40
//            }
            
            
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
            firstHeight = 0
            secondHeight = 0
            thirdHeight = 0
            if animationIsOn {
                firstAnimation()
            }
        }
    }
}

//#Preview {
//    LoadingView()
//}

struct LoadingView_Preview: PreviewProvider {
    
   @State static var isOn = true
    
    static var previews: some View {
        LoadingView(animationIsOn: $isOn)
    }
}
