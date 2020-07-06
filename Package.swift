// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "VaporEcobee",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "VaporEcobee", targets: ["VaporEcobee"])
    ],
    dependencies: [
        .package(url: "https://github.com/Vapor/Vapor.git", .exact("4.14.0")),
    ],
    targets: [
        .target(name: "VaporEcobee", dependencies: [
          "Vapor",
        ], path: "Sources")
    ]
)
