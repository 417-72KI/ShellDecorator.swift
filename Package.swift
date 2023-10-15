// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShellDecorator",
    platforms: [.macOS(.v12), .iOS("999999"), .tvOS("999999"), .watchOS("999999")],
    products: [
        .executable(
            name: "ShellDecoratorsample",
            targets: ["ShellDecoratorSample"]
        ),
        .library(
            name: "ShellDecorator",
            targets: ["ShellDecorator"]
        ),
    ],
    targets: [
        .target(
            name: "ShellDecorator"
        ),
        .executableTarget(
            name: "ShellDecoratorSample",
            dependencies: ["ShellDecorator"]
        ),
        .testTarget(
            name: "ShellDecoratorTests",
            dependencies: ["ShellDecorator"]
        ),
    ]
)
