import Foundation

public enum ANSIAttribute: Int, CaseIterable {
    /// 太字
    case bold = 1
    /// 弱強調
    case lowIntensity = 2
    /// 下線
    case underline = 4
    /// 点滅
    case blink = 5
    /// 反転
    case reverseVideo = 7
    /// 非表示
    case invisibleText = 8
}

// MARK: - Decorate extensions
public extension Decorate {
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
