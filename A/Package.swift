// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "A",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "A", targets: ["A"]),
    ],
    dependencies: [
        .package(name: "Effects", path: "../Effects")
    ],
    targets: [
        .target(
            name: "A",
            dependencies: ["Effects"]),
        .testTarget(
            name: "ATests",
            dependencies: ["A"]),
    ]
)
