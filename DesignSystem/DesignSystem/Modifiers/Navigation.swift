//
//  Navigation.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import SwiftUI

private struct NavigationModifier<SomeView: View>: ViewModifier {
    fileprivate let destination: SomeView
    @Binding fileprivate var isActive: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            NavigationLink(destination: destination, isActive: $isActive) {
                EmptyView()
            }
        }
    }
}

extension View {
    public typealias DestinationView<SomeView: View> = (to: SomeView, when: Binding<Bool>)

    public func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigationModifier(destination: view, isActive: binding))
    }

    public func replace<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigationModifier(destination: view, isActive: binding))
    }
}
