//
//  Spinner.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI
import UIKit

public struct Spinner: UIViewRepresentable {
    public init(isAnimating: Bool, style: UIActivityIndicatorView.Style) {
        self.isAnimating = isAnimating
        self.style = style
    }
    
    public let isAnimating: Bool
    public let style: UIActivityIndicatorView.Style

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
