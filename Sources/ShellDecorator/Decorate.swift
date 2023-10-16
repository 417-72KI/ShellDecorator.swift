import Foundation

public struct Decorate {
    var textColor: ANSIColor?
    var backgroundColor: ANSIColor?
    var attributes: [ANSIAttribute] = []
}

extension Decorate {
    static var `default`: Self { .init() }
}

extension Decorate {
    func build() -> String {
        var string = "\u{001B}["
        if let textColorString {
            if string.last != "[" {
                string += ";"
            }
            string += textColorString
        }
        if let backgroundColorString {
            if string.last != "[" {
                string += ";"
            }
            string += backgroundColorString
        }
        let attributes = attributesString
        if !attributes.isEmpty {
            if string.last != "[" {
                string += ";"
            }
            string += attributes
        }
        return string + "m"
    }

    func reset() -> String {
        Self.default.build()
    }
}

public extension Decorate {
    func callAsFunction(_ string: String) -> String {
        build() + string + reset()
    }
}

private extension Decorate {
    var textColorString: String? {
        textColor
            .map(\.rawValue)
            .map { 30 + $0 }
            .map(String.init)
    }
    var backgroundColorString: String? {
        backgroundColor
            .map(\.rawValue)
            .map { 40 + $0 }
            .map(String.init)
    }
    var attributesString: String {
        attributes
            .map(\.rawValue)
            .map(String.init)
            .joined(separator: ";")
    }
}

extension Decorate {
    mutating func mutate(_ keyPath: WritableKeyPath<Self, ANSIColor?>,
                         _ value: ANSIColor?) {
        self[keyPath: keyPath] = value
    }

    func mutating(_ keyPath: WritableKeyPath<Self, ANSIColor?>,
                  _ value: ANSIColor?) -> Self {
        var copy = self
        copy.mutate(keyPath, value)
        return copy
    }

    mutating func append(attribute: ANSIAttribute) {
        attributes.append(attribute)
    }

    func appending(attribute: ANSIAttribute) -> Self {
        var copy = self
        copy.append(attribute: attribute)
        return copy
    }
}
