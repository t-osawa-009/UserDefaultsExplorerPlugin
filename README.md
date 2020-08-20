# UserDefaultsExplorerPlugin
- [UserDefaultsExplorer](https://github.com/t-osawa-009/UserDefaultsExplorer) plugin.

## Requirements
- Swift 5.x
- iOS 11.0
- Mac OS 10.15

## Usage
Implementing UserDefaultsExplorerPlugin
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
Start the application that implements UserDefaultsExplorerPlugin.
Launch UserDefaultsExplorer.
Allow network with each device by alert.
Once the network is connected, tap the sync button for UserDefaultsExplorer.

## Install
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
