// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let isRelease = false
let devDependencies: [Package.Dependency] = isRelease ? [] : [
    .package(url: "https://github.com/realm/SwiftLint", exact: "0.54.0"),
]
let devPlugins: [Target.PluginUsage] = isRelease ? [] : [
    .plugin(name: "SwiftLintPlugin", package: "SwiftLint"),
]

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
    dependencies: devDependencies,
    targets: [
        .target(
            name: "ShellDecorator",
            plugins: devPlugins
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
