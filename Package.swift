// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IfFormula",
    platforms: [.iOS(.v8), .macOS(.v10_10)],
    products: [
        .library(
            name: "IfFormula",
            targets: ["IfFormula"]),
    ],
    targets: [
        .target(
            name: "IfFormula",
            dependencies: []),
        .testTarget(
            name: "IfFormulaTests",
            dependencies: ["IfFormula"]),
    ]
)
