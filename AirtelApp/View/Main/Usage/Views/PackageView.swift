//
//  PackageView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI

struct PackageView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("6\nMb/s")
                .scaledFont(name: .medium, size: 15)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: .boldBlueColor))
                .padding(.horizontal,11)
                .padding(.vertical, 7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(hex: .lightGrayColor))
                )
            
            VStack(alignment: .leading) {
                Text("Unlimitted")
                    .scaledFont(name: .medium, size: 14)
                    .foregroundColor(Color(hex: .boldGrayColor))
                
                Text("LKR449")
                    .scaledFont(name: .medium, size: 14)
                    .foregroundColor(Color(hex: .boldGrayColor))
            }
            
            Spacer()
            
            Text("buy now >>")
                .scaledFont(name: .regular, size: 10)
                .foregroundColor(Color(hex: .boldGrayColor))
        }
    }
}
