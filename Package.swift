// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Syrup",
    platforms: [
        .tvOS   (.v18),
        .iOS    ("17.6"),
        .macOS  (.v13),
        .macCatalyst(.v18)
    ],
    products: [
        // Two products from the same repo:
        // - `Syrup`   — the full syntactic-sugar surface (also re-exports Expires)
        // - `Expires` — just the `@Expires` property wrapper, for consumers
        //               that want the wrapper without the rest of Syrup.
        .library(name: "Syrup",   targets: ["Syrup"]),
        .library(name: "Expires", targets: ["Expires"]),
    ],
    targets: [
        .target(name: "Expires"),
        .target(name: "Syrup", dependencies: ["Expires"]),
    ]
)
