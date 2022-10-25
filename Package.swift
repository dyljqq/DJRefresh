// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJRefresh",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DJRefresh",
            targets: ["DJRefresh"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DJRefresh",
            dependencies: []),
        .testTarget(
            name: "DJRefreshTests",
            dependencies: ["DJRefresh"]),
    ]
)
