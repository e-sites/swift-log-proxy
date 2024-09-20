// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "swift-log-proxy",
    products: [
      .library(name: "ProxyLogHandler", targets: ["ProxyLogHandler"])
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
          name: "ProxyLogHandler",
          dependencies: [ "Logging" ]
        )
    ]
)
