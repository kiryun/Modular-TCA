// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "B1",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "B1", targets: ["B1"])
    ],
    dependencies: [
        .package(name: "Effects", path: "../Effects"),
        .package(name: "B2", path: "../B2")
    ],
    targets: [
        .target(
            name: "B1",
            dependencies: ["Effects", "B2"]),
        .testTarget(
            name: "B1Tests",
            dependencies: ["B1"]),
    ]
)
