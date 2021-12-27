//
//  PackagePeriodView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI

struct PackagePeriodView: View {
    var periodPackageList: [String]
    @Binding var periodItemSelected: String
    var onChangeItemSelection: (String) -> ()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 31) {
                ForEach(periodPackageList,id:\.self) { item in
                    Text(item)
                        .scaledFont(name: item == periodItemSelected ? .medium : .regular, size: 12)
                        .foregroundColor(item == periodItemSelected ?  Color(hex: .primaryColor) : Color(hex: .grayColor))
                        .onTapGesture {
                            withAnimation {
                                onChangeItemSelection(item)
                            }
                        }
                }
                
            }
        }
    }
}
