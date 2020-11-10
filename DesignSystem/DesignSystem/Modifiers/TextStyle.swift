//
//  TextStyle.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.Typography.titleFont)
            .foregroundColor(Color.App.textTitle)
    }
}

struct ContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.Typography.bodyFont)
            .foregroundColor(Color.App.textBody)
    }
}

extension Text {
    public enum TextStyle {
        case title
        case content
    }

    public func textStyle(_ style: TextStyle) -> some View {
        switch style {
        case .title:
            return AnyView(textStyle(TitleStyle()))
        case .content:
            return AnyView(textStyle(ContentStyle()))
        }
    }

    private func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        modifier(style)
    }
}
