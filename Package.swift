// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "VaporEcobee",
    products: [
        .library(name: "VaporEcobee", targets: ["VaporEcobee"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.14.0"),
    ],
    targets: [
        .target(name: "VaporEcobee", dependencies: [
          .product(name: "Vapor", package: "vapor")
        ], path: "Sources")
    ]
)
