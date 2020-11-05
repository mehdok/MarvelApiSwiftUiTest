//
//  ObservableUseCase.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import RxSwift

public protocol ObservableUseCase {
    /// The response value emitted by the Observable.
    associatedtype Output

    /// The request value.
    associatedtype Input

    /// Execute the usecase with specified input and generate specified output
    /// - Parameter input: UseCase input argument
    /// - Returns: Observable of output
    func execute(_ input: Input) -> Observable<Output>
}
