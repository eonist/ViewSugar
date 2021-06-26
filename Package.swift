// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ViewSugar",
    platforms: [.iOS(.v12), .macOS(.v10_14)],
    products: [
        .library(
            name: "ViewSugar",
            targets: ["ViewSugar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/Spatial.git", .branch("master")),
        .package(url: "https://github.com/eonist/With.git", .branch("master"))

    ],
    targets: [
        .target(
            name: "ViewSugar",
            dependencies: ["Spatial", "With"]),
        .testTarget(
            name: "ViewSugarTests",
            dependencies: ["ViewSugar"]),
    ]
)
