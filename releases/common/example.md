```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/goinstant/pods-specs-public'
source 'https://github.com/forcedotcom/SalesforceMobileSDK-iOS-Specs.git'

use_frameworks!

# Install the complete Service SDK
target '<your app target>' do
    pod 'ServiceSDK'
end
```