# ComponentModuleC

[![CI Status](https://img.shields.io/travis/jiaojiaozhe/ComponentModuleC.svg?style=flat)](https://travis-ci.org/jiaojiaozhe/ComponentModuleC)
[![Version](https://img.shields.io/cocoapods/v/ComponentModuleC.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleC)
[![License](https://img.shields.io/cocoapods/l/ComponentModuleC.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleC)
[![Platform](https://img.shields.io/cocoapods/p/ComponentModuleC.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleC)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ComponentModuleC is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ComponentModuleC'
```

## Author

jiaojiaozhe, lanbiao@zhihuihutong.com

## License

ComponentModuleC is available under the MIT license. See the LICENSE file for more info.

## Publish
本地验证： pod lib lint ComponentModuleC.podspec --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
本地验证&远程验证: pod spec lint --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
发布：pod repo push jiaojiaozhe ComponentModuleC.podspec  --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
