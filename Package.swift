// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultsExplorerPlugin",
    platforms: [.iOS("11.0"), .macOS("10.15")],
    products: [
        .library(name: "UserDefaultsExplorerPlugin", targets: ["UserDefaultsExplorerPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AccioSupport/CocoaAsyncSocket.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "UserDefaultsExplorerPlugin",
            dependencies: ["CocoaAsyncSocket"]),
        .testTarget(
            name: "UserDefaultsExplorerPluginTests",
            dependencies: ["UserDefaultsExplorerPlugin",
                           "CocoaAsyncSocket"]),
    ]
)
