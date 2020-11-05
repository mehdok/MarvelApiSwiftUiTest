//
//  Dependencies.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//
//  Based on https://basememara.com/swift-dependency-injection-via-property-wrapper/

/// Resolves an instance from the dependency injection container.
@propertyWrapper
public class Inject<Value> {
    private let name: String?
    private var storage: Value?

    public var wrappedValue: Value {
        storage ?? {
            let value: Value = Dependencies.root.resolve(for: name)
            storage = value // Reuse instance for later
            return value

        }()
    }

    public init() {
        name = nil
    }

    public init(_ name: String) {
        self.name = name
    }
}

/// A dependency collection that provides resolutions for object instances.
public class Dependencies {
    /// Stored object instance factories.
    private var modules: [String: Module] = [:]
    private init() {}
    deinit { modules.removeAll() }
}

private extension Dependencies {
    /// Registers a specific type and its instantiating factory.
    func add(module: Module) {
        modules[module.name] = module
    }

    /// Resolves through inference and returns an instance of the given type from the current default container.
    ///
    /// If the dependency is not found, an exception will occur.
    func resolve<T>(for name: String? = nil) -> T {
        let name = name ?? String(describing: T.self)
        guard let component: T = modules[name]?.resolve() as? T else {
            fatalError("Dependency '\(T.self)' not resolved")
        }

        return component
    }
}

public extension Dependencies {
    /// Composition root container of dependencies.
    fileprivate static var root = Dependencies()

    /// Construct dependency resolutions.
    convenience init(@ModuleBuilder _ modules: () -> [Module]) {
        self.init()
        modules().forEach { add(module: $0) }
    }

    /// Construct dependency resolution.
    convenience init(@ModuleBuilder _ module: () -> Module) {
        self.init()
        add(module: module())
    }

    /// Assigns the current container to the composition root.
    func build() {
        Self.root = self
    }

    /// DSL for declaring modules within the container dependency initializer.
    @_functionBuilder struct ModuleBuilder {
        public static func buildBlock(_ modules: Module...)
            -> [Module] { modules }

        public static func buildBlock(_ module: Module) -> Module { module }
    }
}

/// A type that contributes to the object graph.
public struct Module {
    fileprivate let name: String
    fileprivate let resolve: () -> Any

    public init<T>(_ name: String? = nil, _ resolve: @escaping () -> T) {
        self.name = name ?? String(describing: T.self)
        self.resolve = resolve
    }
}
