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
