// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SeleniumSwiftExample",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    dependencies: [
        .package(name: "selenium-swift", path: "../")
    ],
    targets: [
        .executableTarget(
            name: "SeleniumSwiftExample",
            dependencies: [
                .product(name: "SeleniumSwift", package: "selenium-swift")
            ]),
        .testTarget(
            name: "SeleniumSwiftExampleTests",
            dependencies: ["SeleniumSwiftExample"]),
    ]
)
