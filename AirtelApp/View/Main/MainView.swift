//
//  MainView.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import SwiftUI

struct MainView: View {
    @State var tabItemIndexSelected = 0
    var body: some View {
        VStack {
            HStack {
                Image("airtelHeaderLogo")
                Spacer()
                Image("notification")
            }
            .padding(.horizontal)
            
            TabView(selection: $tabItemIndexSelected) {
                UsageView()
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        VStack {
                            Text("Usage")
                            Image("usageIcon")
                                .renderingMode(.template)
                        }.onTapGesture {
                            tabItemIndexSelected = 0
                        }
                    }
                
                Text("Recharge")
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        VStack {
                            Text("Recharge")
                            Image("rechargeIcon")
                                .renderingMode(.template)
                        }.onTapGesture {
                            tabItemIndexSelected = 1
                        }
                    }
                    
                
                Text("Modem")
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        VStack {
                            Text("Modem")
                            Image("modemIcon")
                                .renderingMode(.template)
                        }.onTapGesture {
                            tabItemIndexSelected = 2
                        }
                    }
                
                Text("Profile")
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        VStack {
                            Text("Profile")
                            Image("profileIcon")
                        }.onTapGesture {
                            tabItemIndexSelected = 3
                        }
                    }
            }.onAppear {
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().backgroundColor = .white
            }
        .accentColor(.red)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
