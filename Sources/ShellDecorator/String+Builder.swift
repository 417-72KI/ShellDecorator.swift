import Foundation

extension String {
    @resultBuilder
    enum Builder {
        static func buildBlock(_ components: String...) -> String {
            components.joined()
        }

        static func buildOptional(_ component: String?) -> String {
            component ?? ""
        }

        static func buildEither(first component: String) -> String {
            component
        }

        static func buildEither(second component: String) -> String {
            component
        }
    }
}

extension String {
    init(@Builder _ builder: () -> String) {
        self = builder()
    }
}
