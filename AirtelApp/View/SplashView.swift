//
//  Splash.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import SwiftUI

struct SplashView: View {
    @State var isAnimating = false
    @Binding var isFinish: Bool
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 1.0)
            .repeatForever()
    }
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .opacity(self.isAnimating ? 0.5 : 1)
                .animation(isFinish ? .default : foreverAnimation,value: self.isAnimating)
                .onAppear {
                    self.isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        isAnimating = false
                        withAnimation {
                            isFinish = true
                        }
                    }
                }
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Color(hex: .primaryColor)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
