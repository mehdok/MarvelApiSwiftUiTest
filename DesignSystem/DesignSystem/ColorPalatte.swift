//
//  ColorPalatte.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI

struct BaseColor {
    static let bundle = Bundle(identifier: "com.mehdok.marvel.DesignSystem")
    
    let primary = Color("primary", bundle: bundle)
    let secondary = Color("secondary", bundle: bundle)
    let textPrimary = Color("textPrimary", bundle: bundle)
    let textSecondary = Color("textSecondary", bundle: bundle)
}

public struct AppColors {
    let baseColor = BaseColor()
    
    public let textTitle: Color!
    public let textBody: Color!

    public let buttonTheme: Color!
    public let buttonHighlight: Color!

    init() {
        textTitle = baseColor.textPrimary
        textBody = baseColor.textPrimary
        buttonTheme = baseColor.primary
        buttonHighlight = baseColor.secondary
    }
}

extension Color {
    public static let App = AppColors()
}

