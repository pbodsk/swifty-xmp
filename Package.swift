// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftyXMP",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "SwiftyXMP", targets: ["SwiftyXMP"]),
        .library(name: "Clibxmp", targets: ["Clibxmp"]),
    ],
    dependencies: [
    ],
    targets: [
      .executableTarget(
          name: "SwiftyXMP-Tester",
          dependencies: ["SwiftyXMP"]),
        .target(
            name: "SwiftyXMP",
            dependencies: ["Clibxmp"]),
        .systemLibrary(
            name: "Clibxmp",
            pkgConfig: "libxmp",
            providers: [
              .brew(["libxmp"]),
              .apt(["libxmp-dev"])
            ]
          )
    ]
)
