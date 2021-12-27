//
//  OnBoardingViewModel.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import Combine

enum AlertType {
    case language
    case signIn
    case signUp
    case noThing
}

enum Languages {
    case english
    case arabic
}

class OnBoardingViewModel: ObservableObject {
    
    @Published private(set) var alertType: AlertType = .noThing
    @Published var isAlertAppear: Bool = false
    
    @Published var mobileNumber: String = ""
    @Published var nicNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isAcceptCondition: Bool = false

    @Published var currentLanguage: Languages = .english
    
    var onFinishOnBoarding: (() -> ())?
    func changeAlertType(with type: AlertType) {
        alertType = type
        if type == .noThing && isAlertAppear {
            onFinishOnBoarding?()
        }
        isAlertAppear.toggle()
        
        
    }
}
