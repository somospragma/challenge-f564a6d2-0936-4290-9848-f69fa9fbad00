// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "TransferApp",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TransferApp",
            targets: ["App"]),
        .library(
            name: "Domain",
            targets: ["Domain"]),
        .library(
            name: "Data",
            targets: ["Data"]),
        .library(
            name: "Presentation",
            targets: ["Presentation"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),
        .package(url: "https://github.com/CombineCommunity/CombineExt.git", from: "1.8.1")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Domain",
                "Data",
                "Presentation",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources/App",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources/Domain",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                .product(name: "CombineExt", package: "CombineExt")
            ],
            path: "Sources/Data",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                "CombineExt"
            ],
            path: "Sources/Presentation",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            path: "Tests/UnitTests/Domain"
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"],
            path: "Tests/UnitTests/Presentation"
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"],
            path: "Tests/UnitTests/Data"
        )
    ],
    swiftLanguageVersions: [.v6]
)