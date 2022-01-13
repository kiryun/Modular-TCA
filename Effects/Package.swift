// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Effects",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Effects", type: .dynamic, targets: ["Effects"]),
    ],
    dependencies: [
    
        // MARK: https://forums.swift.org/t/how-to-integrate-tca-framework-as-of-0-1-3/36443 여기서는 안된다고 함.
        // 위 링크는 옛날 자료고 아래처럼 하면 됨
//        package(
//            url: "https://github.com/pointfreeco/swift-composable-architecture",
//            .upToNextMajor(from: "0.33.0")
//        )
        .package(
            name: "swift-composable-architecture",
            path: "../swift-composable-architecture"
        )
    ],
    targets: [
        .target(
            name: "Effects",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "EffectsTests",
            dependencies: ["Effects"]),
    ]
)
