# ComponentModuleB

[![CI Status](https://img.shields.io/travis/jiaojiaozhe/ComponentModuleB.svg?style=flat)](https://travis-ci.org/jiaojiaozhe/ComponentModuleB)
[![Version](https://img.shields.io/cocoapods/v/ComponentModuleB.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleB)
[![License](https://img.shields.io/cocoapods/l/ComponentModuleB.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleB)
[![Platform](https://img.shields.io/cocoapods/p/ComponentModuleB.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleB)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ComponentModuleB is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ComponentModuleB'
```

## Author

jiaojiaozhe, lanbiao@zhihuihutong.com

## License  

ComponentModuleB is available under the MIT license. See the LICENSE file for more info.

## Publish
本地验证： pod lib lint ComponentModuleB.podspec --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
本地验证&远程验证: pod spec lint --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
发布：pod repo push jiaojiaozhe ComponentModuleB.podspec  --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
