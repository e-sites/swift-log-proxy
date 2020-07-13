# swift-log-proxy

## Installation

### SwiftPM

**package.swift** dependency:

```swift
.package(url: "https://github.com/e-sites/swift-log-proxy.git", from: "9.0.0"),
```

and to your application/library target, add `"ProxyLogHandler"` to your `dependencies`, e.g. like this:

```swift
.target(name: "BestExampleApp", dependencies: ["ProxyLogHandler"]),
```

## Implementation

### Initialization

```swift
import ProxyLogHandler
import Logging

let logger = Logger(label: "com.swift-log.awesome-app")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
       LoggingSystem.bootstrap { label -> LogHandler in
            return ProxyLogHandler(label: label) { level, message, metadata, file, function, line in
               // Do something, for instance call Crashlytics
            }
        }
        
        return true
    }
}
```
