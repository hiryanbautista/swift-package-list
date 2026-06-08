// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageList",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .macCatalyst(.v13),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1),
    ],
    products: [
        .executable(name: "swift-package-list", targets: ["swift-package-list"]),
        .library(name: "SwiftPackageListBinary", targets: ["SwiftPackageListBinary"]),
        .plugin(name: "SwiftPackageListPlugin", targets: ["SwiftPackageListPlugin"]),
        .library(name: "SwiftPackageList", targets: ["SwiftPackageList"]),
        .library(name: "SwiftPackageListUI", targets: ["SwiftPackageListUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "swift-package-list",
            dependencies: [
                .target(name: "SwiftPackageListCore"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .binaryTarget(
    name: "SwiftPackageListBinary",
    url: "https://github.com/hiryanbautista/swift-package-list/releases/download/4.10.4-test/SwiftPackageListBinary.artifactbundle.zip",
    checksum: "2ae8d60e945547acbae06a4827d9e23309c54d9e2ffadd4d3257022c62a2a83a"
),
        .plugin(
            name: "SwiftPackageListPlugin",
            capability: .buildTool(),
            dependencies: [.target(name: "swift-package-list")]
        ),
        .target(
            name: "SwiftPackageListCore",
            dependencies: [.target(name: "SwiftPackageList")]
        ),
        .target(
            name: "SwiftPackageList",
            resources: [.process("Resources")]
        ),
        .target(
            name: "SwiftPackageListUI",
            dependencies: [.target(name: "SwiftPackageList")],
            resources: [.process("Resources")]
        ),
        .testTarget(name: "swift-package-list-tests"),
        .testTarget(
            name: "SwiftPackageListCoreTests",
            dependencies: [.target(name: "SwiftPackageListCore")],
            resources: [.copy("Resources")]
        ),
        .testTarget(
            name: "SwiftPackageListTests",
            dependencies: [.target(name: "SwiftPackageList")],
            resources: [.process("Resources")]
        ),
    ]
)
