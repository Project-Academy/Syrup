# Syrup

A small Swift utility package providing **syntactic sugar** — convenience extensions and helpers across Foundation, UIKit, SwiftUI, and PDFKit — used across the Project Academy app ecosystem.

The name reflects the intent: every API in here is something you can already do with Apple's frameworks, just made shorter, sweeter, and more readable.

## Installation

Swift Package Manager. Requires **iOS 17.6+** or **macOS Ventura+**.

```swift
.package(url: "https://github.com/Project-Academy/Syrup", from: "0.0.1")
```

```swift
import Syrup
```

## What's inside

### `AppInfo`
Typed access to the running app's `Info.plist` values, plus a `SemVer` type for working with version strings.

```swift
AppInfo.appName         // "Library"
AppInfo.version         // SemVer (Comparable, Codable)
AppInfo.buildNo         // "1043"
AppInfo.secrets         // any custom `Secrets` dictionary embedded in Info.plist

if AppInfo.version >= SemVer("2.0.0") { … }
```

### `Core/DateTime`
Extensions on `Date`, `Calendar`, `DateFormatter`, and `TimeInterval` for everyday date/time work.

```swift
Date().inFormat("d MMM")                       // "13 May"
Calendar.current.dateRangeForWeek()            // ISO-8601 Mon-Sun closed range
(weekStart...weekEnd).asString                 // "13 to 19 May"  (or "26 May to 1 Jun")

DateFormatter("yyyy-MM-dd")                    // one-arg convenience init
TimeInterval.minutes(5)                        // 300.0
```

### `Core/JSONDecoder`
A `DateDecodingStrategy.iso8601Flexible` that accepts both fractional-second and plain ISO-8601 timestamps, so you don't have to guess which one your backend will emit.

```swift
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601Flexible
// matches "2026-04-26T10:30:00Z" and "2026-04-26T10:30:00.123Z"
```

### `Core/Prefs`
A `@Prefs` property wrapper around `UserDefaults`. Native types (`Bool`, `Int`, `Float`, `Double`, `String`, `Data`, `Date`) are stored directly; any other `Codable` type is JSON-encoded automatically.

```swift
@Prefs("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
@Prefs("lastSyncedAt") var lastSyncedAt: Date?
@Prefs("currentTheme") var currentTheme: Theme = .default

// Optional-typed Prefs default to nil:
@Prefs("user") var user: User?

// Hook into decoding/encoding failures or evict stale data via PrefsOptions:
@Prefs("settings", PrefsOptions(staleData: .remove)) var settings: Settings = .init()
```

### `UIKit/UIColor`
Hex initialisers and a `.random` generator.

```swift
UIColor(from: "#FF6B35")    // optional, accepts with or without "#", 6 or 8 hex digits
UIColor(0xFF6B35)           // non-optional Int literal
UIColor.random
```

### `UIKit/UIFont`
Weighted system-font shortcuts, sizing helpers, and design/style modifiers.

```swift
UIFont.systemFont(17)
UIFont.semiboldSystemFont(13)
UIFont.heavySystemFont(28).rounded
existingFont.upsize(by: 2).italic
```

### `UIKit/Layout`
Constraint and inset conveniences.

```swift
view.heightAnchor
    .constraint(equalToConstant: 44)
    .priority(.defaultHigh)

NSDirectionalEdgeInsets(16)   // uniform on all sides
```

### `UIKit/Animation`
Cross-dissolve transition shorthand for `UIView`.

```swift
UIView.crossDissolve(with: containerView, duration: 0.3) {
    label.text = newText
}
```

### `UIKit/UICollectionView`
Type aliases and a `CVDiffable` protocol that bundle the boilerplate around diffable data sources.

```swift
typealias PKSnapshot   = NSDiffableDataSourceSnapshot
typealias PKDataSource = UICollectionViewDiffableDataSource
typealias CellReg      = UICollectionView.CellRegistration
typealias SuppReg      = UICollectionView.SupplementaryRegistration

class MyVC: UIViewController, CVDiffable {
    var snap: Snapshot = .init()
    var data: DataSource!
    func applySnapshot(animated: Bool) { data.apply(snap, animatingDifferences: animated) }
}
```

## Layout

```
Sources/Syrup/
├── AppInfo/        // AppInfo.swift, SemVer.swift
├── Core/
│   ├── DateTime/   // Calendar, Date, DateFormatter, TimeInterval
│   ├── JSONDecoder.swift
│   └── Prefs/      // Prefs.swift, PrefsOptions.swift
├── SwiftUI/        // View.swift  (placeholder)
└── UIKit/
    ├── Animation/  // Transition.swift
    ├── Layout/     // NSLayoutConstraint.swift, UIEdgeInsets.swift
    ├── PDFKit/     // PDFView.swift  (placeholder)
    ├── UICollectionView.swift
    ├── UIColor.swift
    └── UIFont.swift
```

## Scope

Things that belong here:
- Extensions and helpers on existing Apple framework types.
- Small property wrappers and typealiases that reduce ceremony.
- Anything that exists purely to make calling-code shorter or clearer.

Things that don't:
- Networking (see `Presto`).
- Supabase wiring (see `Supa`).
- App-specific business logic.
