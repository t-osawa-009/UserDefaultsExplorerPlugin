// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "UserDefaultsExplorerPlugin",
     platforms: [.iOS("11.0"), .macOS("10.15")],
    products: [
        .library(name: "UserDefaultsExplorerPlugin", targets: ["UserDefaultsExplorerPlugin"])
    ],
    targets: [
        .target(
            name: "UserDefaultsExplorerPlugin",
            path: "Sources"
        )
    ]
)
