//
//  DesignSystemModule.swift
//  DesignSystem
//
//  Created by Mehdok on 11/10/20.
//

import Combine
import SwiftUI

public protocol DesignSystemModuleType {
    associatedtype UIScheduler
    func component() -> UIScheduler
}

public struct DesignSystemModule<RunLoopScheduler: Combine.Scheduler>: DesignSystemModuleType {
    public typealias UIScheduler = RunLoopScheduler
    
    public init() {}

    public func component() -> RunLoopScheduler {
        RunLoop.main as! RunLoopScheduler
    }
}
