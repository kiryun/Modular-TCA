// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "A1",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "A1", targets: ["A1"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Effects", path: "../Effects")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "A1",
            dependencies: ["Effects"]),
        .testTarget(
            name: "A1Tests",
            dependencies: ["A1"]),
    ]
)
