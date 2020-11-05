//
//  BaseScreen.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import SwiftUI

protocol BaseScreen: View {
    associatedtype VM: BaseViewModel
    var viewModel: VM { get set }
}
