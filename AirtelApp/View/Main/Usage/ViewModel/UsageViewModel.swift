//
//  UsageViewModel.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI
import Combine

class UsageViewModel: ObservableObject {
    
    @Published var offerTimeRemaining: String = ""
    @Published var hasOffer: Bool = true
    private var timeRemaining = 1*1*10
    var onStopTimer: (() -> ())?
    
    var periodPackageList: [String] = [
        "1 month","3 months","6 months","9 months","12 months"
    ]
    
    @Published var periodItemSelected = "1 month"
    
    
    
    
    private func timeFormatter()  {
        let hours   = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) / 60 % 60
        let seconds = Int(timeRemaining) % 60
        offerTimeRemaining =  String(format:"%02i Hrs %02i Min %02i Sec", hours, minutes, seconds)
    }
    
    func countDown() {
        if self.timeRemaining > 0 {
            self.timeRemaining -= 1
            timeFormatter()
        }else{
            onStopTimer?()
            withAnimation {
                hasOffer.toggle()
            }
        }
    }
    
    func changePeriodPackageItemSelection(to item: String) {
        periodItemSelected = item
    }
}
