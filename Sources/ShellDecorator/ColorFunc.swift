import Foundation

public struct ColorFunc {
    var textColor: ANSIColor?
    var backgroundColor: ANSIColor?
    var attributes: [ANSIAttribute] = []
}

extension ColorFunc {
    static var `default`: Self { .init() }
}

extension ColorFunc {
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

public extension ColorFunc {
    func callAsFunction(_ string: String) -> String {
        build() + string + reset()
    }
}

private extension ColorFunc {
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

extension ColorFunc {
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

public extension ColorFunc {
    static var black: Self { .init(textColor: .black) }
    static var red: Self { .init(textColor: .red) }
    static var green: Self { .init(textColor: .green) }
    static var yellow: Self { .init(textColor: .yellow) }
    static var blue: Self { .init(textColor: .blue) }
    static var magenta: Self { .init(textColor: .magenta) }
    static var cyan: Self { .init(textColor: .cyan) }
    static var white: Self { .init(textColor: .white) }
}

public extension ColorFunc {
    static var backgroundBlack: Self { .init(backgroundColor: .black) }
    static var backgroundRed: Self { .init(backgroundColor: .red) }
    static var backgroundGreen: Self { .init(backgroundColor: .green) }
    static var backgroundYellow: Self { .init(backgroundColor: .yellow) }
    static var backgroundBlue: Self { .init(backgroundColor: .blue) }
    static var backgroundMagenta: Self { .init(backgroundColor: .magenta) }
    static var backgroundCyan: Self { .init(backgroundColor: .cyan) }
    static var backgroundWhite: Self { .init(backgroundColor: .white) }
}

public extension ColorFunc {
    var backgroundBlack: Self { mutating(\.backgroundColor, .black) }
    var backgroundRed: Self { mutating(\.backgroundColor, .red) }
    var backgroundGreen: Self { mutating(\.backgroundColor, .green) }
    var backgroundYellow: Self { mutating(\.backgroundColor, .yellow) }
    var backgroundBlue: Self { mutating(\.backgroundColor, .blue) }
    var backgroundMagenta: Self { mutating(\.backgroundColor, .magenta) }
    var backgroundCyan: Self { mutating(\.backgroundColor, .cyan) }
    var backgroundWhite: Self { mutating(\.backgroundColor, .white) }
}

public extension ColorFunc {
    /// 太字
    var bold: Self { appending(attribute: .bold) }
    /// 弱強調
    var lowIntensity: Self { appending(attribute: .lowIntensity) }
    /// 下線
    var underline: Self { appending(attribute: .underline) }
    /// 点滅
    var blink: Self { appending(attribute: .blink) }
    /// 反転
    var reverseVideo: Self { appending(attribute: .reverseVideo) }
    /// 非表示
    var invisibleText: Self { appending(attribute: .invisibleText) }
}
