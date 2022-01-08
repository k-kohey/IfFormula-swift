// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IfFormula-swift",
    platforms: [.iOS(.v8), .macOS(.v10_10)],
    products: [
        .library(
            name: "IfFormula-swift",
            targets: ["IfFormula-swift"]),
    ],
    targets: [
        .target(
            name: "IfFormula-swift",
            dependencies: []),
        .testTarget(
            name: "IfFormula-swiftTests",
            dependencies: ["IfFormula-swift"]),
    ]
)
