//
//  UsageView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI
import Combine

struct UsageView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var usageViewModel = UsageViewModel()
    
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text("Popular plans")
                .foregroundColor(Color(hex: .boldGrayColor))
                .scaledFont(name: .medium, size: 14)
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(usageList,id:\.id) { usage in
                        PopularPlansView(usage: usage)
                    }
                }
            }
            .padding(.horizontal)
            
            if usageViewModel.hasOffer {
                OfferView(offerTimeRemaining: $usageViewModel.offerTimeRemaining)
                    .padding(.horizontal)
            }
            
            VStack {
                PackagePeriodView(periodPackageList: usageViewModel.periodPackageList, periodItemSelected: $usageViewModel.periodItemSelected) { item in
                    usageViewModel.changePeriodPackageItemSelection(to: item)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 14) {
                        ForEach(1..<10) { _ in
                            PackageView()
                        }
                    }
                    
                } .padding(.top, 34)
                    .padding(.bottom, 24)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(
                Color.white
                    .shadow(color: Color.black.opacity(0.16), radius: 4, x: 10, y: 10)
                    .cornerRadius(4)
            )
            
            Spacer()
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
            Color(hex: .blueLightColor)
                .edgesIgnoringSafeArea(.all)
        )
        .onReceive(timer) { _ in
            usageViewModel.countDown()
        }
        .onAppear {
            startTimer()
            usageViewModel.onStopTimer = {
                self.stopTimer()
            }
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}
