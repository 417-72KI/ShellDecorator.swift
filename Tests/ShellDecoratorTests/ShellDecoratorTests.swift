import XCTest
@testable import ShellDecorator

final class ColorFuncTests: XCTestCase {
    func testBuild() throws {
        let pattern: [(ColorFunc, String, StaticString, UInt)] = [
            (.default, "\u{001B}[m", #file, #line),
            (.red, "\u{001B}[31m", #file, #line),
            (.green.backgroundYellow, "\u{001B}[32;43m", #file, #line),
            (.blue.backgroundMagenta.bold, "\u{001B}[34;45;1m", #file, #line),
            (.white.backgroundCyan.bold.underline, "\u{001B}[37;46;1;4m", #file, #line),
        ]
        pattern.forEach { cs, expected, file, line in
            XCTAssertEqual(expected, cs.build(), file: file, line: line)
        }
    }
}
