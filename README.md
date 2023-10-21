# AnimatedTabView
A TabView that can be animated in a versatile way! 🪛

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/AnimatedTabView", exact: .init(0, 0, 3))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
extension Tab {
    static var house: Self {
        .init(rawValue: "house")
    }
    static var bookmark: Self {
        .init(rawValue: "bookmark")
    }
    static var message: Self {
        .init(rawValue: "message")
    }
    static var person: Self {
        .init(rawValue: "person")
    }
}
// ...
@State private var selectedTab: Tab = .house
// ...
AnimatedTabView(
    selectedTab: $selectedTab,
    tabs: [.house, .bookmark, .message, .person],
    backgroundColor: { _ in .white },
    foregroundColor: { _ in .black }
)
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/AnimatedTabView/blob/main/Resources/screenrecording.gif?raw=true" width="50%" alt="Example"></p>
