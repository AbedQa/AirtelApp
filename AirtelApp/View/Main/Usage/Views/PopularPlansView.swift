//
//  PopularPlansView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI

struct PopularPlansView: View {
    var usage: Usage
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Spacer(minLength: 10)
            HStack(alignment: .bottom,spacing: 5) {
                Text(usage.bundle)
                    .foregroundColor(Color(hex: .boldBlueColor))
                    .scaledFont(name: .medium, size: 20)
                
                Text(usage.bundleDuration)
                    .foregroundColor(Color(hex: .boldBlueColor))
                    .scaledFont(name: .regular, size: 10)
                
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,10)
            
            
            HStack(alignment: .bottom,spacing: 5) {
                Text(usage.code)
                    .foregroundColor(Color(hex: .boldGrayColor))
                    .scaledFont(name: .medium, size: 14)
                
                Text(usage.validity)
                    .foregroundColor(Color(hex: .grayColor))
                    .scaledFont(name: .regular, size: 10)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,10)
            
            Divider()
            
            HStack(alignment: .bottom,spacing: 5) {
                Spacer()
                Text("view detail >>")
                    .foregroundColor(Color(hex: .primaryColor))
                    .scaledFont(name: .regular, size: 10)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,10)
            Spacer(minLength: 10)
            
        }
        .frame(maxWidth: 155,maxHeight: 117,alignment: .leading)
        .background(
            Color
                .white
                .shadow(color: Color.black.opacity(0.16), radius: 4, x: 10, y: 10)
            
                .cornerRadius(4)
        )
    }
}
