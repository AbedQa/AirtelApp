//
//  OnBording.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import SwiftUI

struct OnBoardingView: View {
    
    @StateObject var onBoaringViewModel: OnBoardingViewModel = .init()
    
    @Binding var isFinishOnBoardingScreens: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Welcome")
                        .foregroundColor(.white)
                        .scaledFont(name: .medium, size: 26)
                    Text("Enjoy the worlds fastest and best network")
                        .foregroundColor(.white)
                        .scaledFont(name: .regular, size: 14)
                }
                .padding(.bottom, 45)
                
                VStack(spacing: 20) {
                    Button(action: {
                        withAnimation {
                            onBoaringViewModel.changeAlertType(with: .signUp)
                        }
                    }) {
                        Text("SIGN UP")
                            .foregroundColor(.white)
                            .scaledFont(name: .semiBold, size: 16)
                    }
                    .frame(maxWidth: .infinity,maxHeight: 42)
                    .background (
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.white)
                    )
                    .padding(.horizontal)
                    
                    Button(action: {
                        withAnimation {
                            onBoaringViewModel.changeAlertType(with: .signIn)
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(Color(hex: .primaryColor))
                            .scaledFont(name: .semiBold, size: 16)
                    }
                    .frame(maxWidth: .infinity,maxHeight: 42)
                    .background (
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                    )
                    .padding(.horizontal)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    Text("Language")
                        .foregroundColor(.white.opacity(0.8))
                        .scaledFont(name: .regular, size: 10)
                    
                    Button {
                        withAnimation {
                            onBoaringViewModel.changeAlertType(with: .language)
                        }
                    } label: {
                        Text(onBoaringViewModel.currentLanguage == .english ? "English" : "Arabic")
                            .foregroundColor(.white.opacity(0.8))
                            .scaledFont(name: .regular, size: 14)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                    }
                    .background (
                        Capsule()
                            .fill(Color.black.opacity(0.2))
                    )
                }.padding(.bottom)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color(hex: .primaryColor)
                    .edgesIgnoringSafeArea(.all)
            )
            
            if onBoaringViewModel.isAlertAppear {
                switch onBoaringViewModel.alertType {
                case .signIn:
                    signInView()
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut,value: onBoaringViewModel.isAlertAppear)
                case .signUp:
                    signUpView()
                        .transition(.move(edge: .bottom))
                        .animation(onBoaringViewModel.isAlertAppear ?  .easeInOut : .easeOut,value: onBoaringViewModel.isAlertAppear)
                case .language:
                    languageView()
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut,value: onBoaringViewModel.isAlertAppear)
                case .noThing:
                    EmptyView()
                }
            }
        }
    }
    
    @ViewBuilder
    func signInView() -> some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading,spacing: 6) {
                    Text("Login")
                        .foregroundColor(Color(hex: .primaryColor))
                        .scaledFont(name: .medium, size: 24)
                    
                    Text("Lets get started")
                        .foregroundColor(Color(hex: .grayColor))
                        .scaledFont(name: .regular, size: 12)
                }
                .padding(.leading)
                .padding(.top)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(alignment: .leading,spacing: 15) {
                    
                    TextField("Mobile Number", text: $onBoaringViewModel.mobileNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(hex: .blueLightColor).cornerRadius(4))
                    
                    SecureField("Password", text: $onBoaringViewModel.password)
                        .padding()
                        .background(Color(hex: .blueLightColor).cornerRadius(4))
                    
                    
                    HStack {
                        Spacer()
                        Text("Forgot password ?")
                            .foregroundColor(Color(hex: .boldGrayColor))
                            .scaledFont(name: .regular, size: 12)
                    }
                    .padding(.top, 6)
                    
                    Button(action: {
                        withAnimation {
                            onBoaringViewModel.changeAlertType(with: .noThing)
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(Color.white)
                            .scaledFont(name: .semiBold, size: 16)
                    }
                    .frame(maxWidth: .infinity,maxHeight: 42)
                    .background (
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: .primaryColor))
                    )
                    .padding(.top, 15)
                }
                .padding(.top)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.bottom)
                
                
                
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(Color.white.clipShape(CustomShape(corner: [.topLeft,.topRight], size: 38)))
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            onBoaringViewModel.onFinishOnBoarding = {
                withAnimation {
                    self.isFinishOnBoardingScreens = true
                }
            }
        }
    }
    
    @ViewBuilder
    func languageView() -> some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    onBoaringViewModel.isAlertAppear.toggle()
                }
            VStack {
                VStack(alignment: .leading,spacing: 6) {
                    Text("Select language")
                        .foregroundColor(Color(hex: .boldGrayColor))
                        .scaledFont(name: .regular, size: 14)
                    
                    
                }
                .padding(.leading)
                .padding(.top)
                .frame(maxWidth: .infinity,alignment: .center)
                
                HStack {
                    
                    Spacer()
                    VStack(spacing: 10) {
                        if onBoaringViewModel.currentLanguage == .english {
                            Text("E")
                                .padding()
                                .foregroundColor(Color.white)
                                .background (
                                    Circle()
                                        .foregroundColor(Color(hex: .primaryColor))
                                )
                        } else {
                            Text("E")
                                .padding()
                                .foregroundColor(Color(hex: .primaryColor))
                                .background (
                                    Circle()
                                        .stroke()
                                        .foregroundColor(Color(hex: .primaryColor))
                                )
                        }
                        
                        Text("English")
                            .foregroundColor(onBoaringViewModel.currentLanguage == .english ? Color(hex: .primaryColor) : Color(hex: .boldGrayColor))
                            .scaledFont(name: .regular, size: 14)
                    }
                    .padding(.top, 6)
                    .onTapGesture {
                        withAnimation {
                            onBoaringViewModel.currentLanguage = .english
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        if onBoaringViewModel.currentLanguage == .arabic {
                            Text("A")
                                .padding()
                                .foregroundColor(Color.white)
                                .background (
                                    Circle()
                                        .foregroundColor(Color(hex: .primaryColor))
                                )
                        } else {
                            Text("A")
                                .padding()
                                .foregroundColor(Color(hex: .primaryColor))
                                .background (
                                    Circle()
                                        .stroke()
                                        .foregroundColor(Color(hex: .primaryColor))
                                )
                        }
                        
                        Text("Arabic")
                            .foregroundColor(onBoaringViewModel.currentLanguage == .english ? Color(hex: .primaryColor) : Color(hex: .boldGrayColor))
                            .scaledFont(name: .regular, size: 14)
                    }
                    .padding(.top, 6)
                    .onTapGesture {
                        withAnimation {
                            onBoaringViewModel.currentLanguage = .arabic
                        }
                    }
                    
                    Spacer()
                }.padding(.bottom)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(Color.white.clipShape(CustomShape(corner: [.topLeft,.topRight], size: 38)))
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    func signUpView() -> some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading,spacing: 6) {
                        Text("Signup")
                            .foregroundColor(Color(hex: .primaryColor))
                            .scaledFont(name: .medium, size: 24)
                        
                        Text("Register with  airtel account number, to start your account !")
                            .foregroundColor(Color(hex: .grayColor))
                            .scaledFont(name: .regular, size: 12)
                    }
                    .padding(.leading)
                    .padding(.top)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    VStack(alignment: .leading,spacing: 15) {
                        
                        TextField("Mobile Number", text: $onBoaringViewModel.mobileNumber)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color(hex: .blueLightColor).cornerRadius(4))
                        
                        TextField("NIC number", text: $onBoaringViewModel.nicNumber)
                            .keyboardType(.numbersAndPunctuation)
                            .padding()
                            .background(Color(hex: .blueLightColor).cornerRadius(4))
                        
                        
                        TextField("Email address", text: $onBoaringViewModel.email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color(hex: .blueLightColor).cornerRadius(4))
                        
                        
                        SecureField("Password", text: $onBoaringViewModel.password)
                            .padding()
                            .background(Color(hex: .blueLightColor).cornerRadius(4))
                        
                        SecureField("Confirm password", text: $onBoaringViewModel.confirmPassword)
                            .padding()
                            .background(Color(hex: .blueLightColor).cornerRadius(4))
                        
                        
                        HStack {
                            Button {
                                withAnimation {
                                    onBoaringViewModel.isAcceptCondition.toggle()
                                }
                            } label: {
                                Image(onBoaringViewModel.isAcceptCondition ? "termsChecked" : "termsUnChecked")
                            }
                            
                            Text("Terms & conditions")
                                .foregroundColor(Color(hex: .boldGrayColor))
                                .scaledFont(name: .regular, size: 12)
                                .onTapGesture {
                                    withAnimation {
                                        onBoaringViewModel.isAcceptCondition.toggle()
                                    }
                                }
                        }
                        .padding(.top, 6)
                        
                        Button(action: {
                            withAnimation {
                                onBoaringViewModel.changeAlertType(with: .noThing)
                            }
                        }) {
                            Text("SIGN up")
                                .foregroundColor(Color.white)
                                .scaledFont(name: .semiBold, size: 16)
                        }
                        .frame(maxWidth: .infinity,minHeight: 42)
                        .background (
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(hex: .primaryColor))
                        )
                        .padding(.top, 15)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom)
                    
                }
                .padding()
            }
            .frame(maxWidth: .infinity,maxHeight: 500,alignment: .leading)
            .background(Color.white.clipShape(CustomShape(corner: [.topLeft,.topRight], size: 38)))

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
    }
}
