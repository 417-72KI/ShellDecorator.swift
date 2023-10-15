import Foundation

public enum ANSIColor: Int, CaseIterable {
    case black = 0
    case red = 1
    case green = 2
    case yellow = 3
    case blue = 4
    case magenta = 5
    case cyan = 6
    case white = 7
}

// MARK: - ColorFunc extensions
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
