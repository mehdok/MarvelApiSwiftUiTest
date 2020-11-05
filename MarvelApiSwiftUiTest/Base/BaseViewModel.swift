//
//  BaseViewModel.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import SwiftUI

private protocol BaseViewModelProtocol: ObservableObject {
    func add(_ cancellable: AnyCancellable)
    func cancel(_ cancellable: AnyCancellable)
    func cancelAll()
}

open class BaseViewModel: BaseViewModelProtocol {
    private var cancellableTokens: [AnyCancellable]? = []

    func add(_ cancellable: AnyCancellable) {
        cancellableTokens?.append(cancellable)
    }

    func cancel(_ cancellable: AnyCancellable) {
        cancellableTokens?.first(where: { $0 == cancellable })?.cancel()
    }

    func cancelAll() {
        cancellableTokens?.forEach { $0.cancel() }
    }
    
    deinit {
        Log.i("deinit: \(String(describing: self))")
        
        cancelAll()
        cancellableTokens = nil
    }
}
