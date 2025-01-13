// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "ObservabilityKitMacros", type: "StringifyMacro")



@attached(accessor, names: named(CaptureIgnored))
public macro CaptureIgnored() = #externalMacro(module: "ObservabilityKitMacros", type: "CaptureIgnoredMacro")

@attached(peer)
public macro CaptureKey(_ key: String) = #externalMacro(module: "ObservabilityKitMacros", type: "CaptureKeyMacro")



@attached(body)
public macro Captured() = #externalMacro(module: "ObservabilityKitMacros", type: "CapturedMacro")
