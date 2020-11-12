//
//  Typography.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI

public struct AppTypography {
    private enum FontSize: CGFloat {
        case
            small = 14,
            medium = 16,
            large = 22
    }

    private enum FontFamily: String {
        case
            helveticaNeue = "HelveticaNeue",
            georgia = "Georgia"
    }

    public enum AppFontSize: CGFloat {
        case
            caption,
            body,
            title

        var value: CGFloat {
            switch self {
            case .caption:
                return FontSize.small.rawValue
            case .body:
                return FontSize.medium.rawValue
            case .title:
                return FontSize.large.rawValue
            }
        }
    }

    public enum AppFontFamily: String {
        case
            title,
            body

        var value: String {
            switch self {
            case .title:
                return FontFamily.helveticaNeue.rawValue
            case .body:
                return FontFamily.georgia.rawValue
            }
        }
    }

    public let titleFont: Font!
    public let bodyFont: Font!

    init() {
        titleFont = Font.custom(AppFontFamily.title.value,
                                size: AppFontSize.title.value)
        bodyFont = Font.custom(AppFontFamily.body.value,
                               size: AppFontSize.body.value)
    }
}

extension AppTypography {
    public func sizingFont(font: AppFontFamily, size: AppFontSize) -> Font {
        return Font.custom(font.value, size: size.value)
    }
}

///

// MARK: Expose Typography to Font struct

///
/// ------
/// To set environment Font, please chain setting
/// `.environment(\.font, Font.Typography.mainFont)`
/// to entry View of the app.
/// ------
///
extension Font {
    public static let Typography = AppTypography()
}
