# UserDefaultsExplorerPlugin
- [UserDefaultsExplorer](https://github.com/t-osawa-009/UserDefaultsExplorer) plugin.
- Userdefaults can edit by xml format

## Requirements
- Swift 5.x
- iOS 11.0
- Mac OS 10.15

## Usage
1. Implementing UserDefaultsExplorerPlugin
```swift
import UIKit
import UserDefaultsExplorerPlugin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let userDefaultsExplorerPlugin = UserDefaultsExplorerPlugin(userDefaults: UserDefaults.standard)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
```
2. Start the application that implements UserDefaultsExplorerPlugin.
2. Launch UserDefaultsExplorer.
2. Allow network with each device by alert.
2. Once the network is connected, tap the sync button for UserDefaultsExplorer.

## Install
### Cocoa Pods
```
use_frameworks!
pod 'UserDefaultsExplorerPlugin'
```

### Swift Package Manager
```
import PackageDescription

let package = Package(
    [...]
    dependencies: [
        .package(url: "https://github.com/t-osawa-009/UserDefaultsExplorerPlugin.git", from: "0.0.1"),
    ]
)
```

### CONTRIBUTING
There's still a lot of work to do here. We would love to see you involved. You can find all the details on how to get started in the [Contributing Guide](https://github.com/t-osawa-009/UserDefaultsExplorerPlugin/blob/master/CONTRIBUTING.md).

### License
UserDefaultsExplorer is released under the MIT license. See LICENSE for details.
