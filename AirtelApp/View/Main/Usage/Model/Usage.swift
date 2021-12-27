//
//  Usage.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/27/21.
//

import Foundation
struct Usage: Identifiable {
    var id: String = UUID().uuidString
    var bundle: String
    var bundleDuration: String
    var code: String
    var validity: String
}

var usageList: [Usage] = [
    .init(bundle: "10 GB", bundleDuration: "per day", code: "LKR449", validity: "Validty: 34 days"),
    .init(bundle: "5 GB", bundleDuration: "per day", code: "LKR449", validity: "Validty: 34 days"),
    .init(bundle: "10 GB", bundleDuration: "per day", code: "LKR449", validity: "Validty: 34 days"),
]
