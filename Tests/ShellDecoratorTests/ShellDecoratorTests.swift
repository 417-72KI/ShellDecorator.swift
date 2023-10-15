import XCTest
@testable import ShellDecorator

final class ColorFuncTests: XCTestCase {
    func testBuild() throws {
        let pattern: [(ColorFunc, String, StaticString, UInt)] = [
            (.default, "\u{001B}[m", #file, #line)
        ]

        pattern.forEach { cs, expected, file, line in
            XCTAssertEqual(expected, cs.build(), file: file, line: line)
        }
    }
}
