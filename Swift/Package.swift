// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "ObservabilityKit",
  platforms: [.macOS(.v13), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
  products: [
    .library(
      name: "ObservabilityKit",
      targets: ["ObservabilityKitCore"]
    ),
    .executable(
      name: "ObservabilityKitClient",
      targets: ["ObservabilityKitClient"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.3")
  ],
  targets: [
    .target(
      name: "ObservabilityKitCore",
      dependencies: [
        "ObservabilityKitMacros",
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "DependenciesMacros", package: "swift-dependencies")
      ]
    ),
    .macro(
      name: "ObservabilityKitMacros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
      ]
    ),
    // A client of the library, which is able to use the macro in its own code.
    .executableTarget(name: "ObservabilityKitClient", dependencies: ["ObservabilityKitCore"]),
    .testTarget(
      name: "ObservabilityKitCoreTests",
      dependencies: [
        "ObservabilityKitCore",
        
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "DependenciesMacros", package: "swift-dependencies")
      ]
    ),
  ]
)
