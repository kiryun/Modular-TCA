// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "B2",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "B2", targets: ["B2"]),
    ],
    dependencies: [
        .package(name: "Effects", path: "../Effects")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "B2",
            dependencies: ["Effects"]),
        .testTarget(
            name: "B2Tests",
            dependencies: ["B2"]),
    ]
)
