//
//  BasePreview.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI

struct BasePreview<Content>: View where Content: View {
    private let content: () -> Content
    private let previewModes: [ColorScheme]
    private let previewDevices: [CCPreviewDevice]

    public init(
        previewModes: [ColorScheme] = [.light, .dark],
        previewDevices: [CCPreviewDevice] = [.iPhoneXs],
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.previewModes = previewModes
        self.previewDevices = previewDevices
        self.content = content
    }

    var body: some View {
        contentBody
    }

    var contentBody: some View {
        ForEach(previewModes, id: \.self) { colorScheme in
            ForEach(self.previewDevices, id: \.self) { deviceName in
                self.content()
                    .environment(\.colorScheme, colorScheme)
                    .previewDevice(PreviewDevice(rawValue: deviceName.rawValue))
                    .previewDisplayName("\(deviceName.rawValue) - \(colorScheme)")
            }
        }
    }
}
