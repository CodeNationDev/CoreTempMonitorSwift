// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreTempMonitorSwift",
    platforms: [
          // Add support for all platforms starting from a specific version.
          .iOS(.v12),
          .tvOS(.v12),
          .watchOS(.v4),
          .macOS(.v10_14),
      ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CoreTempMonitorSwift",
            targets: ["CoreTempMonitorSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CoreTempMonitorSwift",
            dependencies: [])
    ]
)
