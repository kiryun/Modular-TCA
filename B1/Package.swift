// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "B1",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "B1", targets: ["B1"]),
    ],
    dependencies: [
        .package(name: "Effects", path: "../Effects")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "B1",
            dependencies: ["Effects"]),
//            dependencies: []),
        .testTarget(
            name: "B1Tests",
            dependencies: ["B1"]),
    ]
)
