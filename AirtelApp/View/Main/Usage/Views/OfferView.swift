//
//  OfferView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI


struct OfferView: View {
    @Binding var offerTimeRemaining: String
    var body: some View {
        HStack {
            Image("offer")
            
            VStack(alignment: .leading) {
                HStack {
                    Text("New Offers")
                        .scaledFont(name: .regular, size: 14)
                        .foregroundColor(Color(hex: .boldGrayColor))
                    
                    Text("Only for you, avail today")
                        .scaledFont(name: .regular, size: 10)
                        .foregroundColor(Color(hex: .grayColor))
                }
                
                Text(offerTimeRemaining)
                    .scaledFont(name: .bold, size: 20)
                    .foregroundColor(Color(hex: .primaryColor))
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
            Color.white
                .shadow(color: Color.black.opacity(0.16), radius: 4, x: 10, y: 10)
                .cornerRadius(4)
        )
    }
}
