//
//  FontManager.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import SwiftUI

private var fontParentName = "Poppins"

enum FontType: String {
    case extraLight
    case thinItalic
    case extraLightItalic
    case boldItalic
    case light
    case medium
    case regular
    case semiBoldItalic
    case extraBoldItalic
    case extraBold
    case blackItalic
    case lightItalic
    case bold
    case black
    case thin
    case semiBold
    case italic
    case mediumItalic
}
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom("\(fontParentName)-\(name)", size: scaledSize))
    }
}

extension View {
    func scaledFont(name: FontType, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name.rawValue.capitalized, size: size))
    }
}
