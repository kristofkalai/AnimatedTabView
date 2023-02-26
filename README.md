# AnimatedTabView
A TabView that can be animated in a versatile way! 🪛

### How to use

First you should create your tabs:

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
```

Then create a @State variable and the View itself:


```swift
@State private var selectedTab: Tab = .house

...
                
AnimatedTabView(
    selectedTab: $selectedTab,
    tabs: [.house, .bookmark, .message, .person],
    backgroundColor: { _ in .white },
    foregroundColor: { _ in .black }
)
```

For details see the Example app.

### Example

<p style="text-align:center;"><img src="https://github.com/stateman92/AnimatedTabView/blob/main/Resources/screenrecording.gif?raw=true" width="50%" alt="Example"></p>
