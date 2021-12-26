//
//  ContentView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @State var isFinishSplash = false
    var body: some View {
        ZStack {
            if isFinishSplash {
                OnBoardingView()
            } else {
                SplashView(isFinish: $isFinishSplash)
            }
        }
        .transition(.slide)
        .animation(.easeInOut,value: isFinishSplash)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
