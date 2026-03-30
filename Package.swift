// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DEKeyOverlay",
    platforms: [
        .macOS(.v13)
    ],
    targets: [
        .executableTarget(
            name: "DEKeyOverlay",
            path: "Sources",
            linkerSettings: [
                .linkedFramework("AppKit"),
                .linkedFramework("SwiftUI"),
                .linkedFramework("Carbon")
            ]
        ),
    ]
)
