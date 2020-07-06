// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "API",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "API", targets: ["API"])
    ],
    dependencies: [
        .package(url: "https://github.com/Vapor/Vapor.git", .exact("4.14.0")),
    ],
    targets: [
        .target(name: "API", dependencies: [
          "Vapor",
        ], path: "Sources")
    ]
)
